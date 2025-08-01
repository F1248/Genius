//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import Foundation
import ObjectiveC
import os

extension Process {

	convenience init?(_ executable: String, _ arguments: String..., asRoot runAsRoot: Bool = false) {
		self.init()
		if runAsRoot, SystemInformation.Software.OS.bootMode.value != .recovery {
			guard let executableURL = URL(filePath: "/usr/bin/osascript") else { return nil }
			self.executableURL = executableURL
			self.arguments = [
				"-e",
				"""
				do shell script \"\(executable) \(arguments.joined(separator: " "))\" \
				with prompt \"\(String(localized: .administratorPrivilegesRequest))\" \
				with administrator privileges
				""",
			]
		} else {
			guard let executableURL = URL(filePath: executable) else { return nil }
			self.executableURL = executableURL
			self.arguments = arguments
		}
		self.qualityOfService = .userInitiated
	}

	func waitUntilExit() async {
		await withCheckedContinuation { continuation in
			terminationHandler = { _ in
				continuation.resume()
			}
		}
	}

	func runSafe() async -> String? {
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
		await waitUntilExit()
		let errorPipeData = errorPipe.read()
		let outputPipeData = outputPipe.read()
		guard terminationStatus == 0, terminationReason == .exit, errorPipeData == nil, let outputPipeData else {
			logError(outputPipeData: outputPipeData, errorPipeData: errorPipeData)
			return nil
		}
		return outputPipeData
	}

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
