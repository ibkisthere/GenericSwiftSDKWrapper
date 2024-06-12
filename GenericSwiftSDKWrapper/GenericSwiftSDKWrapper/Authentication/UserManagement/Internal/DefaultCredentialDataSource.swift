//
//
//import Foundation
//
//final class DefaultCredentialDataSource: CredentialDataSource {
//    private let queue = DispatchQueue(label: "com.genericsdk.credentialDataSource.credentials",
//                                      attributes: .concurrent)
//
//    private var credentials: [Credential] = []
//
//    weak var delegate: CredentialDataSourceDelegate?
//
//    var credentialCount: Int {
//        queue.sync { credentials.count }
//    }
//    
//    func hasCredential(for token: Token) -> Bool {
//        queue.sync { !credentials.filter({ $0.token == token }).isEmpty }
//    }
//
//    func credential(for token: Token, coordinator: CredentialCoordinator) -> Credential {
//        queue.sync {
//            if let credential = credentials.first(where: { $0.token == token }) {
//                return credential
//            } else {
//                let urlSession = self.urlSession(for: token)
//                let client = OAuth2Client(token.context.configuration,
//                                          session: urlSession)
//                let credential = Credential(token: token,
//                                            oauth2: client,
//                                            coordinator: coordinator)
//                credentials.append(credential)
//                
//                delegate?.credential(dataSource: self, created: credential)
//
//                return credential
//            }
//        }
//    }
//    
//    func remove(credential: Credential) {
//        queue.sync(flags: .barrier) {
//            guard let index = credentials.firstIndex(of: credential) else { return }
//            credentials.remove(at: index)
//            delegate?.credential(dataSource: self, removed: credential)
//        }
//    }
//}
