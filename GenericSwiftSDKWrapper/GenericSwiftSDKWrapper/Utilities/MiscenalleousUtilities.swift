//
//  MiscenalleousUtilities.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 11/06/2024.
//

import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

// MARK: Dictionary Extensions

public extension Dictionary where Key == String, Value == String {
    
    /**
     Encodes this dictionary into data according to the "x-www-form-urlencoded"
     format.
    
     Returns `nil` if the query string cannot be converted to `Data` using a
     utf-8 character encoding.
     */
    func formURLEncoded() -> Data? {
        
        var urlComponents = URLComponents()
        urlComponents.queryItems = self.map { item in
            URLQueryItem(name: item.key, value: item.value)
        }
        return (urlComponents.percentEncodedQuery ?? "").data(using: .utf8)
    }
    
}

public extension DecodingError {
    
    /// The context of the error. Each of the enum cases have a context.
    var context: Context? {
        switch self {
            case .dataCorrupted(let context):
                return context
            case .keyNotFound(_, let context):
                return context
            case .typeMismatch(_, let context):
                return context
            case .valueNotFound(_, let context):
                return context
            @unknown default:
                return nil
        }
    }
    
    /**
     Formats the coding path as if you were accessing nested properties from a
     Swift type; e.g., "items[27].track.album.release_date".
     */
    var prettyCodingPath: String? {
    
        guard let context = self.context else {
            return nil
        }

        var formattedPath = ""
        for codingKey in context.codingPath {
            if let intValue = codingKey.intValue {
                formattedPath += "[\(intValue)]"
            }
            else {
                if !formattedPath.isEmpty {
                    formattedPath += "."
                }
                formattedPath += codingKey.stringValue
            }
        }
        return formattedPath
    }
    
}

// MARK: - Comma Separated String -

public extension Sequence where
    Element: RawRepresentable,
    Element.RawValue: StringProtocol
{
    
    /**
     Creates a comma separated string of the raw values of the sequence's
     elements. No spaces are added between the commas.
          Available when Sequence.Element conforms to `RawRepresentable` and
     `Element.RawValue` conforms to `StringProtocol` (`String` or `SubString`).
    
     Equivalent to `self.map(\.rawValue).joined(separator: ",")`.
     */
    @inlinable @inline(__always)
    func commaSeparatedString() -> String {
        return self.map(\.rawValue).joined(separator: ",")
    }
    
}

public extension Sequence where Element: Equatable {
    
    /// Returns an array with only the unique elements of this sequence.
    func removingDuplicates() -> [Element] {
        var uniqueElements: [Element] = []
        for element in self {
            if !uniqueElements.contains(element) {
                uniqueElements.append(element)
            }
        }
        return uniqueElements
    }

}

public extension Collection where Index == Int {

    /// Splits this collection into an array of arrays, each of which will have
    /// the specified size (although the last may be smaller).
    ///
    /// - Parameter size: The size of each nested array.
    func chunked(size: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, self.count)])
        }
    }

}


/**
 Returns a new dictionary in which the key-value pairs for which the values are
 `nil` are removed from the dictionary and the remaining values are converted to
 strings.

 The LosslessStringConvertible protocol prevents you from using types that
 cannot be converted to strings without losing information. (It should be
 possible to re-create an instance of a conforming type from its string
 representation.)
 
 `String` and `Int` are examples of conforming types.
 
 - Parameter dictionary: A dictionary in which the keys are strings and the
       values are optional types with a wrapped type that conforms to
       `LosslessStringConvertible`; that is, a type that can be represented as a
       string in a lossless, unambiguous way.
 */
@inlinable
public func urlQueryDictionary(
    _ dictionary: [String: LosslessStringConvertible?]
) -> [String: String] {
    let unwrapped = dictionary.compactMapValues { $0 }
    return unwrapped.mapValues { "\($0)" }
}

extension Optional where Wrapped == String {
    
    /// Returns the wrapped value enclosed in double quotes or the string "nil"
    /// if this instance is `nil`.
    func quotedOrNil() -> String {
        if let wrapped = self {
            return #""\#(wrapped)""#
        }
        return "nil"
    }
    
}

extension String {
    
    /**
     Adds an indent to each line in this string **except the first line**.
    
     - Parameter tabEquivalents: The number of tab equivalents by which to
           indent each line. Each tab equivalent is actually represented as
           four spaces instead of the tab character.
     */
    func indented(tabEquivalents: Int) -> Self {
        
        let leadingSpaces = String(repeating: " ", count: tabEquivalents * 4)
        
        var firstLine = true
        return self
            .split(separator: "\n")
            .map { line in
                if firstLine {
                    firstLine = false
                    return String(line)
                }
                return leadingSpaces + line
            }
            .joined(separator: "\n")
        
    }

}



public extension CharacterSet {
    
    /// A combination of `urlQueryAllowed` and `urlPathAllowed`.
    static let urlQueryAndPathAllowed = CharacterSet.urlQueryAllowed.union(
        .urlPathAllowed
    )

}


