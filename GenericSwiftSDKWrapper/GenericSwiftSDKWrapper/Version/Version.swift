//
//  Version.swift
//  GenericSwiftSDKWrapper
//
//  Created by Ibukunoluwa Akintobi on 11/06/2024.
//


// Provides a mechanism for registering SDK versions and generating a user agent string that includes information about the SDKs, the system, and the device model.


import Foundation

#if canImport(UIKit)
import UIKit
#endif

#if os(watchOS)
import WatchKit
#endif

private let deviceModel: String = {
    var system = utsname()
    uname(&system)
    let model = withUnsafePointer(to: &system.machine.0) { ptr in
        return String(cString: ptr)
    }
    return model
}()

private let systemName: String = {
    #if os(iOS)
        return "iOS"
    #elseif os(watchOS)
        return "watchOS"
    #elseif os(tvOS)
        return "tvOS"
    #elseif os(macOS)
        return "macOS"
    #elseif os(Linux)
        return "linux"
    #endif
}()

private let systemVersion: String = {
    #if os(iOS) || os(tvOS)
        return UIDevice.current.systemVersion
    #elseif os(watchOS)
        return WKInterfaceDevice.current().systemVersion
    #else
        let osVersion = ProcessInfo.processInfo.operatingSystemVersion
        return "\(osVersion.majorVersion).\(osVersion.minorVersion).\(osVersion.patchVersion)"
    #endif
}()

public final class SDKVersion {
    public let name: String
    public let version: String
    
    public init(sdk name: String, version: String) {
        self.name = name
        self.version = version
    }

    public var displayName: String { "\(name)/\(version)" }
    public private(set) static var userAgent: String = ""

    fileprivate static var sdkVersions: [SDKVersion] = []
    public static func register(sdk: SDKVersion) {
        guard sdkVersions.filter({ $0.name == sdk.name }).isEmpty else {
            return
        }
        
        sdkVersions.append(sdk)

        let sdkVersions = SDKVersion.sdkVersions
            .sorted(by: { $0.name < $1.name })
            .map(\.displayName)
            .joined(separator: " ")
        userAgent = "\(sdkVersions) \(systemName)/\(systemVersion) Device/\(deviceModel)"
    }
}

extension String {
    func expanded(using: [String: APIRequestArgument]) -> String {
        using.reduce(self) { (string, argument) in
            string.replacingOccurrences(of: "{\(argument.key)}", with: argument.value.stringValue)
        }
    }
}


//
//let sdk1 = SDKVersion(sdk: "MySDK", version: "1.0.0")
//let sdk2 = SDKVersion(sdk: "AnotherSDK", version: "2.3.1")
//
//SDKVersion.register(sdk: sdk1)
//SDKVersion.register(sdk: sdk2)
//
//print(SDKVersion.userAgent)
