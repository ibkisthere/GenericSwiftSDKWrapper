//
//  ReqresApiClient.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 12/06/2024.
//

import Foundation
import Logging


/// This is the code for the Api Client
struct JSONPlaceholderApiClient : APIClient {
    func decode<T>(_ type: T.Type, from data: Data, userInfo: [CodingUserInfoKey : Any]?) throws -> T where T : Decodable {
        
        let jsonDecoder: JSONDecoder
        if let jsonType = type as? JSONDecodable.Type {
            jsonDecoder = jsonType.jsonDecoder
        } else {
            jsonDecoder = defaultJSONDecoder
        }
        
        return try jsonDecoder.decode(type, from: data)
    }
    
    var baseURL:URL {
        URL(string: "")!
    }
    
    ///use this for logging
    func didSend(request: URLRequest, received error: APIClientError, requestId: String?, rateLimit: APIRateLimit?) {
        AppLoggers.apiClientLogger.log(level: .critical, "An error occurred \(error)")
    }
    
    func shouldRetry(request: URLRequest, rateLimit: APIRateLimit) -> APIRetry {
        APIRetry.retry(maximumCount: 3)
    }
}



