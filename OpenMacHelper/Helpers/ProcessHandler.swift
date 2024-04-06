//
//  ProcessHandler.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

func runProcess(_ arguments: [String]) -> String {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: arguments.first!) // swiftlint:disable:this force_unwrapping
    process.arguments = Array(arguments.dropFirst())
    let output = Pipe()
    process.standardOutput = output
    try! process.run() // swiftlint:disable:this force_try
    return String(decoding: output.fileHandleForReading.readDataToEndOfFile(), as: UTF8.self)
}
