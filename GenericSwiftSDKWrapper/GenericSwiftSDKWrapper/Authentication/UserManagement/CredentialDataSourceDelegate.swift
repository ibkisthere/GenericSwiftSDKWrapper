//
//import Foundation
//
///// Protocol that a custom ``CredentialDataSource`` instances are required to communicate changes to.
//public protocol CredentialDataSourceDelegate: AnyObject {
//    /// Sent when a new credential is created.
//    ///
//    /// This is usually sent in response to the ``CredentialDataSource/credential(for:coordinator:)`` method, but in any other circumstance where a credential is created, this message should be sent.
//    func credential(dataSource: CredentialDataSource, created credential: Credential)
//    
//    /// Sent when an existing credential is removed from the data source cache.
//    ///
//    /// The credential may be re-created at a later date, if its token has not been removed from the ``TokenStorage``. This message is only to indicate that the credential has been removed from the data source cache.
//    func credential(dataSource: CredentialDataSource, removed credential: Credential)
//}
