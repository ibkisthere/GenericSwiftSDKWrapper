//
//  APIClient+Extensions.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 11/06/2024.
//

import Foundation

extension APIClient {
    public var additionalHttpHeaders: [String: String]? { nil }
    public var requestIdHeader: String? { "x-generic-api-request-id" }
    public var userAgent: String { SDKVersion.userAgent }
    
    public func error(from data: Data) -> Error? {
        defaultJSONDecoder.userInfo = [:]
        return try? defaultJSONDecoder.decode(GenericSDKAPIError.self, from: data)
    }
    
    public func willSend(request: inout URLRequest) {}
    
    public func didSend(request: URLRequest, received error: APIClientError) {}
    
    public func didSend(request: URLRequest, received response: HTTPURLResponse) {}
    
    public func didSend<T>(request: URLRequest, received response: APIResponse<T>) {}
    
    public func send<T>(_ request: URLRequest, parsing context: APIParsingContext? = nil, completion: @escaping (Result<APIResponse<T>, APIClientError>) -> Void) {
        send(request, parsing: context, state: nil, completion: completion)
    }
    
    public func shouldRetry(request: URLRequest, rateLimit: APIRateLimit) -> APIRetry { .default }
    
    // swiftlint:disable closure_body_length
    private func send<T>(_ request: URLRequest,
                         parsing context: APIParsingContext? = nil,
                         state: APIRetry.State?,
                         completion: @escaping (Result<APIResponse<T>, APIClientError>) -> Void) {
        var urlRequest = request
        willSend(request: &urlRequest)
        session.dataTaskWithRequest(urlRequest) { data, response, httpError in
            guard let data = data,
                  let response = response
            else {
                let apiError: APIClientError
                if let error = httpError {
                    apiError = .serverError(error)
                } else {
                    apiError = .missingResponse
                }
                
                completion(.failure(apiError))
                return
            }
            
            var rateInfo: APIRateLimit?
            var requestId: String?
            do {
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw APIClientError.invalidResponse
                }
                
                self.didSend(request: request, received: httpResponse)
                
                rateInfo = APIRateLimit(with: httpResponse.allHeaderFields)
                let responseType = context?.resultType(from: httpResponse) ?? APIResponseResult(statusCode: httpResponse.statusCode)
                if let requestIdHeader = requestIdHeader {
                    requestId = httpResponse.allHeaderFields[requestIdHeader] as? String
                }

                switch responseType {
                case .success:
                    let response: APIResponse<T> = try self.validate(data: data,
                                                                     response: httpResponse,
                                                                     rateInfo: rateInfo,
                                                                     parsing: context)
                    self.didSend(request: request, received: response)
                    completion(.success(response))
                case .retry:
                    guard let rateInfo = rateInfo else {
                        fallthrough
                    }
                    let retry = state?.type ?? self.shouldRetry(request: request, rateLimit: rateInfo)
                    
                    switch retry {
                    case .doNotRetry: break
                    case .retry(let maximumCount):
                        let retryState: APIRetry.State
                        if let state = state {
                            retryState = state.nextState()
                        } else {
                            retryState = APIRetry.State(type: retry,
                                                        requestId: requestId,
                                                        originalRequest: request,
                                                        retryCount: 1)
                        }
                        
                        // Fall-through to the default case if the maximum retry attempt has been reached and if the delay is not calculated.
                        guard retryState.retryCount <= maximumCount, let delay = rateInfo.delay else {
                            break
                        }
                        
                        let urlRequest = addRetryHeadersToRequest(state: retryState)
                        
                        DispatchQueue.global().asyncAfter(deadline: .now() + delay) {
                            self.send(urlRequest, parsing: context, state: retryState, completion: completion)
                        }
                        return
                    }
                    fallthrough
                case .error:
                    if let error = error(from: data) ?? context?.error(from: data) {
                        throw APIClientError.serverError(error)
                    } else {
                        throw APIClientError.statusCode(httpResponse.statusCode)
                    }
                }
            } catch let error as APIClientError {
                self.didSend(request: request, received: error, requestId: requestId, rateLimit: rateInfo)
                completion(.failure(error))
            } catch {
                let apiError = APIClientError.cannotParseResponse(error: error)
                self.didSend(request: request, received: apiError, requestId: requestId, rateLimit: rateInfo)
                completion(.failure(apiError))
            }
        }.resume()
    }
    // swiftlint:enable closure_body_length

    private func addRetryHeadersToRequest(state: APIRetry.State) -> URLRequest {
        var request = state.originalRequest
        if let requestId = state.requestId {
            request.allHTTPHeaderFields?.updateValue(requestId, forKey: "X-Retry-For")
        }
        request.allHTTPHeaderFields?.updateValue(state.retryCount.stringValue, forKey: "X-Retry-Count")
        return request
    }
}
