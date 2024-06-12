//
//  GenericLogHandler.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 11/06/2024.
//

import Foundation
import Logging

enum AppLoggers {
    
    /*
     These loggers are publicly exposed though computed properties on the
     authorization managers.
     */
    
    static var apiClientLogger = Logger(
        label: "apiClient", level: .critical
    )
    
    static var apiRequesLtogger = Logger(
        label: "AuthorizationCodeFlowManager",
        level: .critical
    )

    static var jsonDecodeLogger = Logger(
        label: "AuthorizationCodeFlowPKCEManager",
        level: .critical
    )
    
    static var errorLogger = Logger(
        label: "ClientCredentialsFlowManager",
        level: .critical
    )
    
}
