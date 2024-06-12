//
//  KeyChainError.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 10/06/2024.
//

import Foundation

#if os(iOS) || os(macOS) || os(tvOS) || os(watchOS)

/// Describes errors that may occur when interacting with the keychain.
public enum KeychainError: Error {
    /// There was a failure getting a keychain item.
    case cannotGet(code: OSStatus)

    /// There was a failure getting a list of keychain items.
    case cannotList(code: OSStatus)

    /// There was a failure saving a keychain item.
    case cannotSave(code: OSStatus)

    /// There was a failure deleting a keychain item.
    case cannotDelete(code: OSStatus)

    /// There was a failure updating a keychain item.
    case cannotUpdate(code: OSStatus)

    /// The access control settings for this keychain item are invalid.
    case accessControlInvalid(code: OSStatus, description: String?)

    /// Could not find a keychain item.
    case notFound

    /// The returned keychain item is in an invalid format.
    case invalidFormat

    /// The keychain item has an invalid accessibility option set.
    case invalidAccessibilityOption

    /// The keychain item is missing an account name.
    case missingAccount

    /// The keychain item is missing its value data.
    case missingValueData

    /// The keychain item is missing required attributes.
    case missingAttribute
}

extension KeychainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .cannotGet(code: let status):
            return String.localizedStringWithFormat(
                NSLocalizedString("keychain_cannot_get",
                                  tableName: "GenericApi",
                                  comment: ""),
                status)

        case .cannotList(code: let status):
            return String.localizedStringWithFormat(
                NSLocalizedString("keychain_cannot_list",
                                  tableName: "Authentication",
                                  comment: ""),
                status)

        case .cannotSave(code: let status):
            return String.localizedStringWithFormat(
                NSLocalizedString("keychain_cannot_save",
                                  tableName: "Authentication",
                                  comment: ""),
                status)

        case .cannotUpdate(code: let status):
            return String.localizedStringWithFormat(
                NSLocalizedString("keychain_cannot_update",
                                  tableName: "Authentication",
                                  comment: ""),
                status)

        case .cannotDelete(code: let status):
            return String.localizedStringWithFormat(
                NSLocalizedString("keychain_cannot_delete",
                                  tableName: "Authentication",
                                  comment: ""),
                status)

        case .accessControlInvalid(code: let code, description: let description):
            return String.localizedStringWithFormat(
                NSLocalizedString("keychain_access_control_invalid",
                                  tableName: "Authentication",
                                  comment: ""),
                description ?? "", code)

        case .notFound:
            return NSLocalizedString("keychain_not_found",
                                     tableName: "Authentication",

                                     comment: "")

        case .invalidFormat:
            return NSLocalizedString("keychain_invalid_format",
                                     tableName: "Authentication",
                                     comment: "")

        case .invalidAccessibilityOption:
            return NSLocalizedString("keychain_invalid_accessibility_option",
                                     tableName: "Authentication",
                                     comment: "")

        case .missingAccount:
            return NSLocalizedString("keychain_missing_account",
                                     tableName: "Authentication",
                                     comment: "")

        case .missingValueData:
            return NSLocalizedString("keychain_missing_value_data",
                                     tableName: "Authentication",
                                     comment: "")

        case .missingAttribute:
            return NSLocalizedString("keychain_missing_attribute",
                                     tableName: "Authentication",
                                     comment: "")
        }
    }
}

#endif
