//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import AppKit
import Foundation

extension URL: Openable {

	init?(filePath: String) {
		guard FileManager.default.fileExists(atPath: filePath) else { return nil }
		self.init(fileURLWithPath: filePath)
	}

	init?(appleSupportArticle: Int) {
		self.init(string: "https://support.apple.com/\(appleSupportArticle)")
	}

	init?(appleUserGuideArticle: String) {
		let versionNumberComponent: String =
			SystemInformation.Software.OS.version.value?.uiRepresentation.map { "/\($0)" } ?? ""
		self.init(string: "https://support.apple.com/guide/mac-help/\(appleUserGuideArticle)/mac\(versionNumberComponent)")
	}

	init?(string: String, available: Bool?) {
		guard available ?? true else { return nil }
		self.init(string: string)
	}

	func open() {
		NSWorkspace.shared.open(self)
	}
}
