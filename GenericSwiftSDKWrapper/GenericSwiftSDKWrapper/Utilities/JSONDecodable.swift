//
//  JSONDecodable.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 10/06/2024.
//

import Foundation

public protocol JSONDecodable {
    static var jsonDecoder: JSONDecoder { get }
}
