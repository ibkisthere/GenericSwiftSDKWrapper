//
//import Foundation
//
//extension Token {
//    /// Describes the metadata associated with a token.
//    ///
//    /// This is used when storing tags and claims associated with tokens,  method.
//    public struct Metadata: JSONClaimContainer {
//        public typealias ClaimType = JWTClaim
//
//        /// The unique ID for the token.
//        public let id: String
//        
//        /// Developer-assigned tags.
//        public let tags: [String: String]
//        
//        /// The raw contents of the claim payload for this token.
//        public let payload: [String: Any]
//        
//        private let payloadData: Data?
//        init(token: Token, tags: [String: String]) {
//            self.id = token.id
//            self.tags = tags
//            
//            var payload = [String: Any]()
//            var payloadData: Data?
//            
//            if let idToken = token.idToken {
//                let tokenComponents = JWT.tokenComponents(from: idToken.rawValue)
//                if tokenComponents.count == 3 {
//                   payloadData = Data(base64Encoded: tokenComponents[1])
//                }
//            }
//            
//            if let payloadData = payloadData,
//               let payloadInfo = try? JSONSerialization.jsonObject(with: payloadData) as? [String: Any]
//            {
//                payload = payloadInfo
//            }
//            
//            self.payload = payload
//            self.payloadData = payloadData
//        }
//        
//        init(id: String) {
//            self.id = id
//            self.tags = [:]
//            self.payload = [:]
//            self.payloadData = nil
//        }
//    }
//}
//
//extension Token.Metadata {
//    public static var jsonDecoder = JSONDecoder()
//}
//
//extension Token.Metadata: Codable {
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        self.payloadData = try container.decodeIfPresent(Data.self, forKey: .payload)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.tags = try container.decode([String: String].self, forKey: .tags)
//        
//        if let data = self.payloadData,
//           let payload = try JSONSerialization.jsonObject(with: data) as? [String: Any]
//        {
//            self.payload = payload
//        } else {
//            self.payload = [:]
//        }
//    }
//    
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(tags, forKey: .tags)
//        try container.encode(payloadData, forKey: .payload)
//    }
//    
//    enum CodingKeys: String, CodingKey {
//        case id, tags, payload
//    }
//}
