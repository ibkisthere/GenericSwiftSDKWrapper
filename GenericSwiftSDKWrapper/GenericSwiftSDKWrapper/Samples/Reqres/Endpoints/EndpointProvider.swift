//
//  EndpointProvider.swift
//  GenericSwiftSDKWrapper
//


import Foundation

///we will be using reqres.in as the Generic SDK Api to show the api client in action

public enum Endpoints {
    
    // MARK: - Base -
    
    /**
     The base URL for the Generic SDK Api service.
     
     ```
     ""
     ```
     */
    public static let apiBase = "https://reqres.in"
    
    /// The api version 1. (Commented out because the api does not have versioning)
    /// ```
    /// "/v1"
    /// ```
//    public static let apiVersion1 = "/v1"
    

    // MARK: - Authorization -
    
    /// The path for authorizing your app with login.
    /// ```
    /// "/login"
    /// ```
    public static let authorize = "/login"
    
    /**
     The path for requesting tokens. When response is successful , a token will be returned
    
     ```
     "/api/token"
     ```
     */
//    public static let token = "/api/token"
    
    /**
     The URL for retrieving refresh and access tokens, and refreshing the
     access token.
    
     ```
     "https://genericapi.com/api/token"
     ```
     */
//    public static let getTokens = URL(
//        scheme: "https",
//        host: Endpoints.apiBase,
//        path: Endpoints.token
//    )!
    
    /**
     The path for registering users . When response is successful , a token will be returned
     */
    public static let authorize = "/register"
    
    public static let users = "/users"
}
