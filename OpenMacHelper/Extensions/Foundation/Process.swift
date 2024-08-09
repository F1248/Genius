//
//  Process.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation
import os

extension Process {

    func logError(outputPipeData: String?, errorPipeData: String?) {
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
    }
}
