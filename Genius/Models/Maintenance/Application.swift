//
// © 2026 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import AppKit
import Foundation
import ObjectiveC

struct Application: Openable {

	static let startupSecurityUtility = Self(
		path: "/System/Applications/Utilities/Startup Disk.app",
		arguments: "-ssu",
		available: SystemInformation.Software.OS.bootMode.value ==? .recovery,
	)

	let url: URL
	let arguments: [String]

	init?(
		path: String,
		arguments: String...,
		available: Bool? = true,
	) {
		guard
			available ?? true,
			let url = URL(filePath: path)
		else { return nil }
		self.url = url
		self.arguments = arguments
	}

	func open() async {
		let openConfiguration = NSWorkspace.OpenConfiguration()
		openConfiguration.arguments = arguments
		_ = try? await NSWorkspace.shared.openApplication(at: url, configuration: openConfiguration)
	}
}
