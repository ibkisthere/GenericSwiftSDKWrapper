//
//  APIClient+Operations.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 11/06/2024.
//

import Foundation

extension APIClient {
    func relatedLinks<T>(from linkHeader: String?) -> [APIResponse<T>.Link: URL] {
        guard let linkHeader = linkHeader,
              let matches = linkRegex?.matches(in: linkHeader, options: [], range: NSRange(location: 0, length: linkHeader.count))
        else {
            return [:]
        }
        
        var links: [APIResponse<T>.Link: URL] = [:]
        for match in matches {
            guard let urlRange = Range(match.range(at: 1), in: linkHeader),
                  let url = URL(string: String(linkHeader[urlRange])),
                  let keyRange = Range(match.range(at: 2), in: linkHeader),
                  let key = APIResponse<T>.Link(rawValue: String(linkHeader[keyRange]))
            else {
                continue
            }
            
            links[key] = url
        }
        
        return links
    }
    
    func validate<T>(data: Data, response: HTTPURLResponse, rateInfo: APIRateLimit?, parsing context: APIParsingContext? = nil) throws -> APIResponse<T> {
        var requestId: String?
        if let requestIdHeader = requestIdHeader {
            requestId = response.allHeaderFields[requestIdHeader] as? String
        }
        
        var date: Date?
        if let dateString = response.allHeaderFields["Date"] as? String {
            date = httpDateFormatter.date(from: dateString)
        }
        
        // swiftlint:disable force_unwrapping
        let jsonData = (data.isEmpty) ? "{}".data(using: .utf8)! : data
        // swiftlint:enable force_unwrapping
        
        return APIResponse(result: try decode(T.self,
                                              from: jsonData,
                                              userInfo: context?.codingUserInfo),
                           date: date ?? Date(),
                           statusCode: response.statusCode,
                           links: relatedLinks(from: response.allHeaderFields["Link"] as? String),
                           rateInfo: rateInfo,
                           requestId: requestId)
    }
}


private let linkRegex = try? NSRegularExpression(pattern: "<([^>]+)>; rel=\"([^\"]+)\"", options: [])
