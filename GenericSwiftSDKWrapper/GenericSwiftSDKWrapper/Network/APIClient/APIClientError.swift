//
//  GenericAPIError.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 10/06/2024.
//

import Foundation

/// Errors that may occur at the API or network level.
public enum APIClientError: Error {
    /// Could not create an invalid URL. This typically means the string passed to `URL` was malformed.
    case invalidUrl
    
    /// No response received from the server.
    case missingResponse
    
    /// Did not receive an HTTP response.
    case invalidResponse
    
    /// An error occurred while parsing the server response.
    case cannotParseResponse(error: Error)
    
    /// Cannot send invalid request data to the server.
    case invalidRequestData
    
    /// Cannot refresh a token since it is missing refresh information.
    case missingRefreshSettings
    
    /// Request does not support the given content type.
    case unsupportedContentType(_ type: APIContentType)
    
    /// Received the given HTTP error from the server.
    case serverError(_ error: Error)
    
    /// Received the given HTTP response status code.
    case statusCode(_ statusCode: Int)
    
    /// Could not validate the received token.
    case validation(error: Error)
    
    /// An unknown HTTP error was encountered.
    case unknown
}

extension APIClientError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return NSLocalizedString("invalid_url_description",
                                     comment: "Invalid URL")
            
        case .missingResponse:
            return NSLocalizedString("missing_response_description",
                                     comment: "Invalid URL")
            
        case .invalidResponse:
            return NSLocalizedString("invalid_response_description",
                                     comment: "Invalid URL")
            
        case .cannotParseResponse(error: let error):
            let errorString: String
            if let error = error as? LocalizedError {
                errorString = error.localizedDescription
            } else {
                errorString = String(describing: error)
            }

            return String.localizedStringWithFormat(
                NSLocalizedString("cannot_parse_response_description",
                                  comment: "Invalid URL"),
                errorString)
            
        case .invalidRequestData:
            return NSLocalizedString("invalid_request_data_description",
    
                                     comment: "Invalid URL")
            
        case .missingRefreshSettings:
            return NSLocalizedString("missing_refresh_settings_description",
                                     comment: "Invalid URL")
            
        case .unsupportedContentType(let type):
            return String.localizedStringWithFormat(
                NSLocalizedString("unsupported_content_type_description",
                                  comment: "Invalid URL"),
                type.rawValue)
            
        case .serverError(let error):
            if let error = error as? LocalizedError {
                return error.localizedDescription
            }
            let errorString = String(describing: error)

            return String.localizedStringWithFormat(
                NSLocalizedString("server_error_description",
                                  comment: "Invalid URL"),
                errorString)
            
        case .statusCode(let code):
            return String.localizedStringWithFormat(
                NSLocalizedString("status_code_description",
                                  comment: "Invalid URL"),
                code)

        case .validation(error: let error):
            if let error = error as? LocalizedError {
                return error.localizedDescription
            }

            return NSLocalizedString("validation_error",
                                     comment: "Invalid URL")
        case .unknown:
            return NSLocalizedString("unknown_description",
                                     comment: "Invalid URL")
        }
    }
}

extension APIClientError: Equatable {
    private static func compare(lhs: NSError, rhs: NSError) -> Bool {
        (lhs.code == rhs.code &&
         lhs.domain == rhs.domain)
    }
    
    public static func == (lhs: APIClientError, rhs: APIClientError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidUrl, .invalidUrl): return true
        case (.missingResponse, .missingResponse): return true
        case (.invalidResponse, .invalidResponse): return true
        case (.invalidRequestData, .invalidRequestData): return true
        case (.missingRefreshSettings, .missingRefreshSettings): return true
        case (.unknown, .unknown): return true
            
        case (.unsupportedContentType(let lhsType), .unsupportedContentType(let rhsType)):
            return lhsType == rhsType
            
        case (.statusCode(let lhsStatusCode), .statusCode(let rhsStatusCode)):
            return lhsStatusCode == rhsStatusCode
            
        case (.cannotParseResponse(error: let lhsError), .cannotParseResponse(error: let rhsError)):
            return compare(lhs: lhsError as NSError, rhs: rhsError as NSError)
            
        case (.serverError(let lhsError), .serverError(let rhsError)):
            return compare(lhs: lhsError as NSError, rhs: rhsError as NSError)

        case (.validation(error: let lhsError), .validation(error: let rhsError)):
            return compare(lhs: lhsError as NSError, rhs: rhsError as NSError)
            
        default:
            return false
        }
    }
}
