//
//
//import Foundation
//
///// Object defining the structure and settings of a PKCE challenge, including the verifier code, the encoded challenge, and the method used to exchange this information with the server.
//public struct PKCE: Codable, Equatable {
//    /// The auto-generated code verifier data, randmonly-generated.
//    public let codeVerifier: String
//    
//    /// The challenge sent to the server in the initial OAuth2 call.
//    ///
//    /// This will either be SHA256-encoded, or plain text on platforms that do not support SHA256.
//    public let codeChallenge: String
//    
//    /// The challenge method to be sent to the server.
//    public let method: Method
//    
//    /// Enumeration describing the possible challenge encoding methods.
//    public enum Method: String, Codable {
//        /// SHA256-encoding method
//        case sha256 = "S256"
//        
//        /// Plain encoding, for clients where SHA256-encoding is unavailable.
//        case plain
//    }
//    
//    public init?() {
//        codeVerifier = [UInt8].random(count: 32).base64URLEncodedString
//        
//        if let challenge = codeVerifier.pkceCodeChallenge() {
//            codeChallenge = challenge
//            method = .sha256
//        } else {
//            codeChallenge = codeVerifier
//            method = .plain
//        }
//    }
//}
