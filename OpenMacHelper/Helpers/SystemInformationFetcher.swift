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
    guard let outputData = runProcess(["/usr/sbin/system_profiler", "-json", dataType])?.data(using: .utf8) else { return nil }
    let systemProfiler: [String: [[String: Any]]]? = try? JSONSerialization.jsonObject(with: outputData) as? [String: [[String: Any]]]
    return systemProfiler?[dataType]?.first
}

func readDefault(_ domain: String, _ key: String) -> String? {
    runProcess(["/usr/bin/defaults", "read", domain, key])
}

func transferURL(_ url: String) -> String? {
    runProcess(["/usr/bin/curl", "--silent", "--show-error", url])
}
