//
//  ReqresApiClient.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 12/06/2024.
//

import Foundation
import SwiftUI
import Logging

struct ReqresApiClient : APIClient {
    var baseURL: URL
    
    var session: URLSessionProtocol
    
    func decode<T>(_ type: T.Type, from data: Data, userInfo: [CodingUserInfoKey : Any]?) throws -> T where T : Decodable {
        
    }
    
    ///use this for logging
    func didSend(request: URLRequest, received error: APIClientError, requestId: String?, rateLimit: APIRateLimit?) {
        
    }
    
    func shouldRetry(request: URLRequest, rateLimit: APIRateLimit) -> APIRetry {
        APIRetry.retry(maximumCount: 3)
    }
    
}



// apiRequest.send(to: client, parsing: context, completion: { result in
//switch result {
//case .success(let response):
//    XCTAssertEqual(response.statusCode, 400)
//case .failure(_):
//    XCTFail("Did not expect the request to fail")
//}
//expect.fulfill()
//})
