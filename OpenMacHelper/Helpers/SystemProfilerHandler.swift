//
//  SystemProfilerHandler.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

func getSystemProfiler(_ dataType: String) -> [String: Any] {
    let dataType: String = "SP\(dataType)DataType"
    let output = runProcess(["/usr/sbin/system_profiler", "-json", dataType])
    let systemProfiler: [String: [[String: Any]]] = try! JSONSerialization.jsonObject(with: output.data(using: .utf8)!) as! [String: [[String: Any]]] // swiftlint:disable:this force_try force_unwrapping force_cast
    return systemProfiler[dataType]![0] // swiftlint:disable:this force_unwrapping
}
