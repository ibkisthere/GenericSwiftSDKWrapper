//
//import Foundation
//
//extension Credential {
//    func createAutomaticRefreshTimer() -> DispatchSourceTimer? {
//        guard let expiresAt = token.expiresAt else {
//            return nil
//        }
//
//        refreshIfNeeded { _ in }
//
//        automaticRefreshTimer?.cancel()
//
//        let graceInterval = Credential.refreshGraceInterval
//        let timeOffset = max(0.0, expiresAt.timeIntervalSinceNow - Date.nowCoordinated.timeIntervalSinceNow - graceInterval)
//        let repeating = token.expiresIn - graceInterval
//
//        let timerSource = DispatchSource.makeTimerSource(flags: [], queue: oauth2.refreshQueue)
//        timerSource.schedule(deadline: .now() + timeOffset,
//                             repeating: repeating)
//        timerSource.setEventHandler { [weak self] in
//            guard let self = self else { return }
//            self.refreshIfNeeded { _ in }
//        }
//
//        return timerSource
//    }
//
//    func shouldRemove(for type: Token.RevokeType) -> Bool {
//        type == .all ||
//        (type == .refreshToken && token.refreshToken != nil) ||
//        (type == .accessToken && token.refreshToken == nil)
//    }
//}
