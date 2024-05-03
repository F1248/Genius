//
//  SystemProfilerFetcher.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

func getSystemProfiler(_ dataType: String) -> [String: Any]? {
    let dataType: String = "SP\(dataType)DataType"
    guard let outputData = runProcess(["/usr/sbin/system_profiler", "-json", dataType])?.data(using: .utf8) else { return nil }
    let systemProfiler: [String: [[String: Any]]]? = try? JSONSerialization.jsonObject(with: outputData) as? [String: [[String: Any]]]
    return systemProfiler?[dataType]?.first
}
