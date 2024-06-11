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
    public static let apiBase = "https://reqres.in/"
    
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
     The path for requesting and refreshing tokens.
    
     ```
     "/api/token"
     ```
     */
//    public static let token = "/api/token"
    
    /**
     The URL for retrieving refresh and access tokens, and refreshing the
     access token.
    
     ```
     "https://accounts.spotify.com/api/token"
     ```
     */
    public static let getTokens = URL(
        scheme: "https",
        host: Endpoints.apiBase,
        path: Endpoints.token
    )!
    
    
    /**
     Use this method to make all of the endpoints other than those for
     authorizing the application and retrieving/refreshing the tokens.

     Makes an endpoint beginning with:
     ```
     "https://reqres.in/api"
     ```
     Do not forget to add a leading "/" to the path component.
     
     - Parameters:
       - path: A path to append to the URL.
       - queryItems: Query items to add to the URL. Each value in the the
             dictionary that is NOT `nil` will be added to the query string.
     - Returns: The URL, created from the provided path and query items.
     */
    public static func apiEndpoint(
        _ path: String,
        queryItems: [String: LosslessStringConvertible?]
    ) -> URL {

        return URL(
            scheme: "https",
            host: apiBase,
            path: apiVersion1 + path,
            queryItems: urlQueryDictionary(queryItems)
        )!
        
    }
    
    
}
