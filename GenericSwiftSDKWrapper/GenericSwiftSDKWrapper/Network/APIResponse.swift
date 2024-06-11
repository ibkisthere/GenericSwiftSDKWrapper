//
//  APIResponse.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 10/06/2024.
//

import Foundation

/// Describes a response from an Generic API request, which includes the supplied result, and other associated response metadata.
public struct APIResponse<T: Decodable>: Decodable {
    @available(*, deprecated, renamed: "APIRateLimit")
    public typealias RateLimit = APIRateLimit
    
    /// Links between response resources.
    public enum Link: String, Codable {
        case current = "self", next, previous
    }
    
    /// Result provided from the request.
    public let result: T
    
    /// The date the response was received, as reported by the server.
    public let date: Date
    
    /// The actual HTTP status code for the result.
    public let statusCode: Int
    
    /// Information about links between related resources.
    public let links: [Link: URL]
    
    /// Information about the current rate limit.
    public let rateInfo: APIRateLimit?
    
    /// The ID for the current request.
    public let requestId: String?
}

/// Describes an empty server response when a ``APIResponse`` is received without a response body.
public struct Empty: Decodable {}
