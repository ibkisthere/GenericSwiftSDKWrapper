//
//  AdditionalValueCodingKeys.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 10/06/2024.
//

import Foundation

struct AdditionalValuesCodingKeys: CodingKey {
    var stringValue: String
    init?(stringValue: String) {
        self.stringValue = stringValue
    }

    var intValue: Int?
    init?(intValue: Int) {
        return nil
    }
}

extension KeyedDecodingContainer where Key == AdditionalValuesCodingKeys {
    func decodeUnkeyedContainer<T: CodingKey>(exclude keyedBy: T.Type) -> [String: Any] {
        var data = [String: Any]()
    
        for key in allKeys {
            if keyedBy.init(stringValue: key.stringValue) == nil {
                if let value = try? decode(String.self, forKey: key) {
                    data[key.stringValue] = value
                }
                else if let value = try? decode(Bool.self, forKey: key) {
                    data[key.stringValue] = value
                }
                else if let value = try? decode(Int.self, forKey: key) {
                    data[key.stringValue] = value
                }
                else if let value = try? decode(Double.self, forKey: key) {
                    data[key.stringValue] = value
                }
                else if let value = try? decode(Float.self, forKey: key) {
                    data[key.stringValue] = value
                }
            }
        }
    
        return data
    }
}
