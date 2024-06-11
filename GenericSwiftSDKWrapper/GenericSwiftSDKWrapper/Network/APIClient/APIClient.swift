//
//  APIClient.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 10/06/2024.
//

import Foundation

#if os(Linux)
import FoundationNetworking
#endif

public protocol APIClientConfiguration: AnyObject {
    var baseURL: URL { get }
}

/// Protocol defining the interfaces and capabilities that API clients can conform to.
///
/// This provides a common pattern for network operations to be performed, and to centralize boilerplate handling of URL requests, provide customization extensions, and normalize response processing and argument handling.
public protocol APIClient {
    /// The base URL requests are performed against.
    ///
    /// This is used when request types may define their path as relative, and can inherit the URL they should be sent to through the client.
    var baseURL: URL { get }
    
    /// The URLSession requests are sent through.
    var session: URLSessionProtocol { get }
    
    /// Any additional headers that should be added to all requests sent through this client.
    var additionalHttpHeaders: [String: String]? { get }
    
    /// The name of the HTTP response header where unique request IDs can be found.
    var requestIdHeader: String? { get }
    
    /// The User-Agent string to be sent along with all outgoing requests.
    var userAgent: String { get }
    
    /// Decodes HTTP response data into an expected type.
    ///
    /// The userInfo property may be included, which can include contextual information that can help decoders formulate objects.
    /// - Returns: Decoded object.
    func decode<T: Decodable>(_ type: T.Type, from data: Data, userInfo: [CodingUserInfoKey: Any]?) throws -> T
    
    /// Parses HTTP response body data when a request fails.
    /// - Returns: Error instance, if any, described within the data.
    func error(from data: Data) -> Error?
    
    /// Invoked immediately prior to a URLRequest being converted to a DataTask.
    func willSend(request: inout URLRequest)
    
    /// Invoked when a request fails.
    func didSend(request: URLRequest, received error: APIClientError, requestId: String?, rateLimit: APIRateLimit?)

    /// Invoked when a request receives an HTTP response.
    func didSend(request: URLRequest, received response: HTTPURLResponse)
    
    /// Invoked when a request returns a successful response.
    func didSend<T>(request: URLRequest, received response: APIResponse<T>)
    
    /// Send the given URLRequest.
    func send<T: Decodable>(_ request: URLRequest, parsing context: APIParsingContext?, completion: @escaping (Result<APIResponse<T>, APIClientError>) -> Void)
    
    /// Provides the ``APIRetry`` configurations from the delegate in response to a retry request.
    func shouldRetry(request: URLRequest, rateLimit: APIRateLimit) -> APIRetry
}

/// Protocol that delegates of APIClient instances can conform to.
public protocol APIClientDelegate: AnyObject {
    /// Invoked immediately prior to a URLRequest being converted to a DataTask.
    func api(client: APIClient, willSend request: inout URLRequest)
    
    /// Invoked when a request fails.
    func api(client: APIClient, didSend request: URLRequest, received error: APIClientError, requestId: String?, rateLimit: APIRateLimit?)
    
    /// Invoked when a request returns a successful response.
    func api(client: APIClient, didSend request: URLRequest, received response: HTTPURLResponse)

    /// Invoked when a request returns a successful response.
    func api<T>(client: APIClient, didSend request: URLRequest, received response: APIResponse<T>)
    
    /// Provides the APIRetry configurations from the delegate in responds to a retry request.
    func api(client: APIClient, shouldRetry request: URLRequest) -> APIRetry
}

extension APIClientDelegate {
    public func api(client: APIClient, willSend request: inout URLRequest) {}
    public func api(client: APIClient, didSend request: URLRequest, received error: APIClientError, requestId: String?, rateLimit: APIRateLimit?) {}
    public func api(client: APIClient, didSend request: URLRequest, received response: HTTPURLResponse) {}
    public func api<T>(client: APIClient, didSend request: URLRequest, received response: APIResponse<T>) {}
    public func api(client: APIClient, shouldRetry request: URLRequest) -> APIRetry {
        return .default
    }
}

/// List of retry options
public enum APIRetry {
    /// Indicates the APIRequest should not be retried.
    case doNotRetry
    /// The APIRequest should be retried, up to the given maximum number of times.
    case retry(maximumCount: Int)
    
    /// The default retry option.
    public static let `default` = APIRetry.retry(maximumCount: 3)
    
    struct State {
        let type: APIRetry
        let requestId: String?
        let originalRequest: URLRequest
        let retryCount: Int
        
        func nextState() -> State {
            APIRetry.State(type: type,
                           requestId: requestId,
                           originalRequest: originalRequest,
                           retryCount: retryCount + 1)
        }
    }
}

/// Defines the possible results for an API request.
public enum APIResponseResult {
    /// Indicates the request was successful.
    case success
    /// The server is indicating the request should be retried.
    case retry
    /// The server reports the response represents an error.
    case error

    init(statusCode: Int) {
        switch statusCode {
        case 200..<300:
            self = .success
        case 429:
            self = .retry
        default:
            self = .error
        }
    }
}


