

import Foundation

/// Describes errors that may be reported from an Generic API endpoint. 
public struct GenericSDKAPIError: Decodable, Error, LocalizedError, Equatable {
    /// An Generic API code for this type of error.
    public let code: String
    
    /// A short description of what caused this error. Sometimes this contains dynamically-generated information about your specific error.
    public let summary: String

    /// A unique identifier for this error. This can be used to help with troubleshooting.
    public let id: String
    
    /// Further information about what caused this error.
    public let causes: [String]
    
    public var errorDescription: String? { summary }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decode(String.self, forKey: .code)
        summary = try container.decode(String.self, forKey: .summary)
        id = try container.decode(String.self, forKey: .id)
        causes = try container.decode([String].self, forKey: .causes)
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case code = "errorCode"
        case summary = "errorSummary"
        case id = "errorId"
        case causes = "errorCauses"
    }
}
