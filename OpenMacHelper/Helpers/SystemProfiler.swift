//
//  SystemInformationFetcher.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

enum SystemProfiler {
    nonisolated(unsafe) static let firewall = getSystemProfiler("Firewall")
    nonisolated(unsafe) static let hardware = getSystemProfiler("Hardware")
    nonisolated(unsafe) static let software = getSystemProfiler("Software")
}

func getSystemProfiler(_ dataType: String) -> [String: Any]? {
    let dataType: String = "SP\(dataType)DataType"
    guard let outputData = Data(runProcess(["/usr/sbin/system_profiler", "-json", dataType])) else { return nil }
    let systemProfiler: [String: [[String: Any]]]? = try? JSONSerialization.jsonObject(with: outputData) as? [String: [[String: Any]]]
    return systemProfiler?[dataType]?.first
}
