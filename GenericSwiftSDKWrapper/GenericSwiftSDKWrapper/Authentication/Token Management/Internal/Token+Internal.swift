//
//
//
//import Foundation
//
//extension Token {
//    /// When refreshing a token, not all values are always returned, especially the refresh token or device secret.
//    ///
//    /// This function is used to merge these values from an existing token instance to preserve them during a refresh.
//    /// - Parameter token: The old token that has been refreshed.
//    /// - Returns: A new token merging the results of the newly refreshed token, and the older token.
//    func token(merging token: Token) -> Token {
//        guard (refreshToken == nil && token.refreshToken != nil) ||
//                (deviceSecret == nil && token.deviceSecret != nil)
//        else {
//            return self
//        }
//        
//        return Token(id: id,
//                     issuedAt: issuedAt ?? token.issuedAt ?? .nowCoordinated,
//                     tokenType: tokenType,
//                     expiresIn: expiresIn,
//                     accessToken: accessToken,
//                     scope: scope,
//                     refreshToken: refreshToken ?? token.refreshToken,
//                     idToken: idToken,
//                     deviceSecret: deviceSecret ?? token.deviceSecret,
//                     context: context)
//    }
//}
