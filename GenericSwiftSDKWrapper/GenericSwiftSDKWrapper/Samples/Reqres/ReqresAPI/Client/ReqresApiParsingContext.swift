//
//  ReqresApiParsingContext.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 11/06/2024.
//

import Foundation


struct ReqresParsingContext: APIParsingContext {
    var codingUserInfo: [CodingUserInfoKey : Any]?
    
    let result: APIResponseResult?
    
    func resultType(from response: HTTPURLResponse) -> APIResponseResult {
        result ?? APIResponseResult(statusCode: response.statusCode)
    }
}


