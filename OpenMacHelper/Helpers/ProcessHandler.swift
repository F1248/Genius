//
//  ProcessHandler.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

func runProcess(_ arguments: [String], asRoot: Bool = false) -> String? {
    let process = Process()
    if asRoot {
        process.executableURL = URL(fileURLWithPath: "/usr/bin/osascript")
        process.arguments = [
            "-e",
            "do shell script \"\(arguments.joined(separator: " "))\" with prompt \"\("OpenMacHelper requires administrator privileges.".localized)\" with administrator privileges"
        ]
    } else {
        guard let executableURL = arguments.first else { return nil }
        process.executableURL = URL(fileURLWithPath: executableURL)
        process.arguments = Array(arguments.dropFirst())
    }
    let output = Pipe()
    process.standardOutput = output
    try? process.run()
    process.waitUntilExit()
    return String(decoding: output.fileHandleForReading.readDataToEndOfFile(), as: UTF8.self)
}
