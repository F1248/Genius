//
//  SystemProfiler.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import Foundation

enum SystemProfiler {

    nonisolated(unsafe) static let firewall = get("Firewall")
    nonisolated(unsafe) static let hardware = get("Hardware")
    nonisolated(unsafe) static let software = get("Software")

    static func get(_ dataType: String) -> [String: Any]? {
        let dataType = "SP\(dataType)DataType" // swiftlint:disable:this explicit_type_interface
        return (try? JSONSerialization.jsonOptionalObject(
            with: Data(Process("/usr/sbin/system_profiler", ["-json", dataType])?.runSafe())
        ) as? [String: [[String: Any]]])?[dataType]?.first
    }
}
