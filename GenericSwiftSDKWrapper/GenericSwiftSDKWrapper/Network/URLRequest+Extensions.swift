//
//  URLRequest+Extensions.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 11/06/2024.
//

import Foundation

#if os(Linux)
import FoundationNetworking
#endif


//Generates a URL encoded string from a dictionary of parameter
extension URLRequest {
    static func apiURLFormEncodedString(for params: [String: APIRequestArgument]) -> String? {
        func escape(_ str: String) -> String {
            // swiftlint:disable force_unwrapping
            return str.replacingOccurrences(of: "\n", with: "\r\n")
                .addingPercentEncoding(withAllowedCharacters: urlQueryCharacters)!
                .replacingOccurrences(of: " ", with: "+")
            // swiftlint:enable force_unwrapping
        }

        return params.keys.sorted().compactMap {
            guard let value = params[$0]?.stringValue else { return nil }
            return escape($0) + "=" + escape(value)
        }.joined(separator: "&")
    }
    
    private static let urlQueryCharacters: CharacterSet = {
        var allowed = CharacterSet.urlQueryAllowed
        allowed.insert(" ")
        allowed.remove("+")
        allowed.remove("/")
        allowed.remove("&")
        allowed.remove("=")
        allowed.remove("?")
        return allowed
    }()
}
