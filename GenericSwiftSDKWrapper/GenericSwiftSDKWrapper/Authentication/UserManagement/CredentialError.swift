//
//
//import Foundation
//
///// Errors that may occur in the process of managing credentials.
//public enum CredentialError: Error {
//    /// Thrown when a credential no longer has a weak reference to the coordinator that was used to create it.
//    case missingCoordinator
//    
//    /// Thrown when a Credential is initialized with a ``Token`` and ``OAuth2Client`` with mismatched client configuration.
//    case incorrectClientConfiguration
//    
//    /// Thrown when the metadata associated with a token has become inconsistent.
//    case metadataConsistency
//}
//
//extension CredentialError: LocalizedError {
//    public var errorDescription: String? {
//        switch self {
//        case .missingCoordinator:
//            return NSLocalizedString("credential_missing_coordinator",
//                                     tableName: "AuthFoundation",
//                                     bundle: .authFoundation,
//                                     comment: "")
//            
//        case .incorrectClientConfiguration:
//            return  NSLocalizedString("credential_incorrect_configuration",
//                                      tableName: "AuthFoundation",
//                                      bundle: .authFoundation,
//                                      comment: "")
//            
//        case .metadataConsistency:
//            return NSLocalizedString("credential_metadata_consistency",
//                                     tableName: "AuthFoundation",
//                                     bundle: .authFoundation,
//                                     comment: "")
//        }
//    }
//}
