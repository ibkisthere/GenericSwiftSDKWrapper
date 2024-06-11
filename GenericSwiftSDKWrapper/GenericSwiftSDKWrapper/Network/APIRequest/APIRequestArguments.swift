//
//  APIRequestArguments.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 10/06/2024.
//

import Foundation


import Foundation

/// Defines an argument to an ``APIRequest``, this ensures all APIrequest arguments are represented as Strings
///
/// The following types conform to this protocol:
/// - String
/// - Int
/// - Double
/// - Bool
/// - UInt
/// - Int8
/// - UInt8
/// - Int16
/// - UInt16
/// - Int32
/// - UInt32
/// - Int64
/// - UInt64
/// - Float
/// - NSString
/// - NSNumber
public protocol APIRequestArgument {
    /// The string representation of this request argument.
    var stringValue: String { get }
}

extension String: APIRequestArgument {
    public var stringValue: String { self }
}

extension Int: APIRequestArgument {
    public var stringValue: String { "\(self)" }
}

extension Double: APIRequestArgument {
    public var stringValue: String { "\(self)" }
}

extension Bool: APIRequestArgument {
    public var stringValue: String { "\(self)" }
}

extension UInt: APIRequestArgument {
    public var stringValue: String { "\(self)" }
}

extension Int8: APIRequestArgument {
    public var stringValue: String { "\(self)" }
}

extension UInt8: APIRequestArgument {
    public var stringValue: String { "\(self)" }
}

extension Int16: APIRequestArgument {
    public var stringValue: String { "\(self)" }
}
