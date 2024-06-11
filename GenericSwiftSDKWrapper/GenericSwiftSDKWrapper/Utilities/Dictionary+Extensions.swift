//
//  Dictionary+Extensions.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 10/06/2024.
//

import Foundation

extension Dictionary where Key == String, Value == String {
    public var percentQueryEncoded: String {
        var cs = CharacterSet.urlQueryAllowed
        cs.remove("+")

        return compactMap { (key, value) in
            guard let key = key.addingPercentEncoding(withAllowedCharacters: cs),
                  let value = value.addingPercentEncoding(withAllowedCharacters: cs)
            else {
                return nil
            }
            
            return key + "=" + value
        }.sorted().joined(separator: "&")
    }
}

extension Dictionary where Key == String, Value == (any APIRequestArgument)? {
    public var percentQueryEncoded: String {
        compactMapValues { $0?.stringValue }.percentQueryEncoded
    }
}
