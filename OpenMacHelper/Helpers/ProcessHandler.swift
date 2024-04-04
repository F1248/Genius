//
//  ProcessHandler.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

func runProcess(_ arguments: [String]) -> String {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: arguments.first!)
    process.arguments = Array(arguments.dropFirst())
    let output = Pipe()
    process.standardOutput = output
    try! process.run()
    return String(decoding: output.fileHandleForReading.readDataToEndOfFile(), as: UTF8.self)
}
