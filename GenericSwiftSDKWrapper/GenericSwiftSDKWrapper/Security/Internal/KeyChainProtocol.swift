//
//  KeyChainProtocol.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 10/06/2024.
//

import Foundation


#if os(iOS) || os(macOS) || os(tvOS) || os(watchOS)

import Foundation

protocol KeychainProtocol {
    @discardableResult
    func deleteItem(_ query: CFDictionary) -> OSStatus
    
    @discardableResult
    func addItem(_ query: CFDictionary, _ result: UnsafeMutablePointer<CFTypeRef?>?) -> OSStatus

    @discardableResult
    func updateItem(_ query: CFDictionary, _ attributes: CFDictionary) -> OSStatus

    @discardableResult
    func copyItemMatching(_ query: CFDictionary, _ result: UnsafeMutablePointer<CFTypeRef?>?) -> OSStatus
}

struct KeychainImpl: KeychainProtocol {
    func deleteItem(_ query: CFDictionary) -> OSStatus {
        SecItemDelete(query)
    }
    
    func addItem(_ query: CFDictionary, _ result: UnsafeMutablePointer<CFTypeRef?>?) -> OSStatus {
        SecItemAdd(query, result)
    }
    
    func updateItem(_ query: CFDictionary, _ attributes: CFDictionary) -> OSStatus {
        SecItemUpdate(query, attributes)
    }
    
    func copyItemMatching(_ query: CFDictionary, _ result: UnsafeMutablePointer<CFTypeRef?>?) -> OSStatus {
        SecItemCopyMatching(query, result)
    }
}

#endif
