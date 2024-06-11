//
//  GenericLogHandler.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 11/06/2024.
//



import Foundation
//import Logging

enum AppLoggers {
    
    /*
     These loggers are publicly exposed though computed properties on the
     authorization managers.
     */

    static var authorizationCodeFlowManagerBaseLogger = Logger(
        label: "AuthorizationCodeFlowManagerBase",
        level: .critical
    )


    static var authorizationCodeFlowManagerLogger = Logger(
        label: "AuthorizationCodeFlowManager",
        level: .critical
    )

    static var authorizationCodeFlowPKCEManagerLogger = Logger(
        label: "AuthorizationCodeFlowPKCEManager",
        level: .critical
    )
    
    /// Publicly exposed via ``ClientCredentialsFlowBackendManager/logger``.
    static var clientCredentialsFlowManagerLogger = Logger(
        label: "ClientCredentialsFlowManager",
        level: .critical
    )

}
