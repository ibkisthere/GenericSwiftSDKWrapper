//
//
//import Foundation
//
///// Describes errors that may occur when working with tokens.
//public enum TokenError: Error {
//    /// Context information related to this token is missing. This information is used to construct a ``OAuth2Client`` instance that could be used for this token.
//    case contextMissing
//    
//    /// The token with the requested ID was not found.
//    case tokenNotFound(id: String)
//    
//    /// Could not replace the token with its updated value.
//    case cannotReplaceToken
//    
//    /// Could not add a new token, since a duplicate was found.
//    case duplicateTokenAdded
//    
//    /// This token does not match the client configuration. This can only occur when a token's context does not match the ``OAuth2Client`` it is used with.
//    case invalidConfiguration
//}
//
//extension TokenError: LocalizedError {
//    public var errorDescription: String? {
//        switch self {
//        case .contextMissing:
//            return NSLocalizedString("token_context_missing",
//                                     tableName: "Authentication",
//                                     bundle: .authentication,
//                                     comment: "")
//            
//        case .tokenNotFound(id: let id):
//            return String.localizedStringWithFormat(
//                NSLocalizedString("token_not_found",
//                                  tableName: "Authentication",
//                                  bundle: .authentication,
//                                  comment: ""),
//                id)
//            
//        case .cannotReplaceToken:
//            return NSLocalizedString("cannot_replace_token",
//                                     tableName: "Authentication",
//                                     bundle: .authentication,
//                                     comment: "")
//            
//        case .duplicateTokenAdded:
//            return NSLocalizedString("duplicate_token_added",
//                                     tableName: "Authentication",
//                                     bundle: .authentication,
//                                     comment: "")
//
//        case .invalidConfiguration:
//            return NSLocalizedString("invalid_configuration",
//                                     tableName: "Authentication",
//                                     bundle: .authentication,
//                                     comment: "")
//        }
//    }
//}
