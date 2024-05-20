//
//  ProcessHandler.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

func runProcess(_ arguments: [String]) -> String? {
    let process = Process()
    guard let executableURL = arguments.first else { return nil }
    process.executableURL = URL(fileURLWithPath: executableURL)
    process.arguments = Array(arguments.dropFirst())
    let output = Pipe()
    process.standardOutput = output
    try? process.run()
    process.waitUntilExit()
    return String(decoding: output.fileHandleForReading.readDataToEndOfFile(), as: UTF8.self)
}
