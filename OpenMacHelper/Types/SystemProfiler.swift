//
//  SystemProfiler.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

enum SystemProfiler {

    nonisolated(unsafe) static let firewall = get("Firewall")
    nonisolated(unsafe) static let hardware = get("Hardware")
    nonisolated(unsafe) static let software = get("Software")

    static func get(_ dataType: String) -> [String: Any]? {
        let dataType = "SP\(dataType)DataType" // swiftlint:disable:this explicit_type_interface
        guard let outputData = Data(Process("/usr/sbin/system_profiler", ["-json", dataType])?.runSafe()) else { return nil }
        return (try? JSONSerialization.jsonObject(with: outputData) as? [String: [[String: Any]]])?[dataType]?.first
    }
}
