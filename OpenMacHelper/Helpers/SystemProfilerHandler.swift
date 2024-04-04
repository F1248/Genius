//
//  SystemProfilerHandler.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

func getSystemProfiler(_ dataType: String) -> [String: String] {
    (try! JSONSerialization.jsonObject(with: runProcess(["/usr/sbin/system_profiler", dataType, "-json"]).data(using: .utf8)!) as! [String: [[String: String]]])[dataType]![0]
}
