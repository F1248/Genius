//
//  Process.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import Foundation
import ObjectiveC
import os

extension Process {

    convenience init?(_ executable: String, _ arguments: [String] = [], requiresRoot: Bool = false) {
        self.init()
        if requiresRoot, SystemInformation.Software.OS.bootMode != .recovery {
            guard let executableURL = URL("/usr/bin/osascript") else { return nil }
            self.executableURL = executableURL
            self.arguments = [
                "-e",
                """
                do shell script \"\(executable) \(arguments.joined(separator: " "))\"\
                with prompt \"\("Genius requires administrator privileges.".localized())\"\
                with administrator privileges
                """,
            ]
        } else {
            guard let executableURL = URL(executable) else { return nil }
            self.executableURL = executableURL
            self.arguments = arguments
        }
    }

    func runSafe() -> String? {
        let outputPipe = Pipe()
        let errorPipe = Pipe()
        standardOutput = outputPipe
        standardError = errorPipe
        do {
            try run()
        } catch {
            logError(outputPipeData: outputPipe.read(), errorPipeData: errorPipe.read())
            return nil
        }
        waitUntilExit()
        let errorPipeData = errorPipe.read()
        let outputPipeData = outputPipe.read()
        guard terminationStatus == 0, errorPipeData == nil, let outputPipeData else {
            logError(outputPipeData: outputPipeData, errorPipeData: errorPipeData)
            return nil
        }
        return outputPipeData
    }

    func logError(outputPipeData: String?, errorPipeData: String?) {
        // swiftformat:disable redundantSelf
        Logger().error("""
        Process failed:
            Executable: \(self.executableURL.debugDescription)
            Arguments: \(self.arguments.debugDescription)
            Termination status: \(self.terminationStatus)
            Termination reason: \(self.terminationReason.rawValue)
            Standard output:
        \(outputPipeData.debugDescription)
            Standard error:
        \(errorPipeData.debugDescription)
        """)
        // swiftformat:enable redundantSelf
    }
}
