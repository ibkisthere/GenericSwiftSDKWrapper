////
//
//import Foundation
//
//extension Array where Element: FixedWidthInteger {
//    /// Generate an array of cryptographically random integers of the given count.
//    /// - Parameter count: Number of integers to generate.
//    /// - Returns: Array of random integers.
//    public static func random(count: Int) -> [Element] {
//        var array: [Element] = .init(repeating: 0, count: count)
//        (0 ..< count).forEach { array[$0] = Element.random() }
//        return array
//    }
//}
//
//extension Array where Element == UInt8 {
//    /// Convenience method for converting an array of integers into a Base64 URL-encoded string.
//    public var base64URLEncodedString: String {
//        Data(self).base64URLEncodedString
//    }
//}
