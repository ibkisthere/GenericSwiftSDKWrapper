//
//  URLSessionProtocol.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 10/06/2024.
//

import Foundation

#if os(Linux)
import FoundationNetworking
#endif

/// Protocol defining the interface for interacting with a URLSession. This is used to provide mocking for unit tests.
public protocol URLSessionProtocol {
    typealias DataTaskResult = (Data?, HTTPURLResponse?, Error?) -> Void
    func dataTaskWithRequest(_ request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
    var configuration: URLSessionConfiguration { get }
}

/// Protocol defining the interface for interacting with a URLSession. This is used to provide mocking for unit tests.
public protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSession: URLSessionProtocol {
    public func dataTaskWithRequest(_ request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        dataTask(with: request, completionHandler: completionHandler)
    }
}
extension URLSessionDataTask: URLSessionDataTaskProtocol {}
