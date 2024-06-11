
import Foundation

#if os(Linux)
import FoundationNetworking
#endif

extension CredentialDataSource {
    public func urlSession(for token: Token) -> URLSessionProtocol {
        URLSession(configuration: .ephemeral)
    }
}
