//
//
//import Foundation
//
//internal extension String {
//    /// Generates a PKCE code challenge string.
//    /// - Returns: PKCE code challenge string, or `nil` if an error occurs.
//    func pkceCodeChallenge() -> String? {
//        data(using: .ascii)?.sha256()?.base64URLEncodedString
//    }
//}
//
//extension FixedWidthInteger {
//    static func random() -> Self {
//        return Self.random(in: .min ... .max)
//    }
//}
