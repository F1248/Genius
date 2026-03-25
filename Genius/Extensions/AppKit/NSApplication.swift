//
// © 2026 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import AppKit
import Foundation
import ObjectiveC

extension NSApplication {

	func relaunch() async {
		let openConfiguration = NSWorkspace.OpenConfiguration()
		openConfiguration.createsNewApplicationInstance = true
		_ = try? await NSWorkspace.shared.openApplication(at: Bundle.main.bundleURL, configuration: openConfiguration)
		terminate(nil)
	}
}
