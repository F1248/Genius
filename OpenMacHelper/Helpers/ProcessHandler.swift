//
//  ProcessHandler.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

func runProcess(_ arguments: [String], asRoot: Bool = false) -> String? {
    guard !arguments.isEmpty else { return nil }
    let process = Process()
    if asRoot {
        guard let executableURL = URL("/usr/bin/osascript") else { return nil }
        process.executableURL = executableURL
        process.arguments = [
            "-e",
            """
            do shell script \"\(arguments.joined(separator: " "))\"\
            with prompt \"\("OpenMacHelper requires administrator privileges.".localized)\"\
            with administrator privileges
            """,
        ]
    } else {
        guard let executableURL = URL(arguments.first) else { return nil }
        process.executableURL = executableURL
        process.arguments = Array(arguments.dropFirst())
    }
    let outputPipe = Pipe()
    let errorPipe = Pipe()
    process.standardOutput = outputPipe
    process.standardError = errorPipe
    do {
        try process.run()
    } catch {
        process.logError(outputPipeData: outputPipe.read(), errorPipeData: errorPipe.read())
        return nil
    }
    process.waitUntilExit()
    let errorPipeData = errorPipe.read()
    let outputPipeData = outputPipe.read()
    guard process.terminationStatus == 0, errorPipeData == nil, let outputPipeData else {
        process.logError(outputPipeData: outputPipeData, errorPipeData: errorPipeData)
        return nil
    }
    return outputPipeData
}
