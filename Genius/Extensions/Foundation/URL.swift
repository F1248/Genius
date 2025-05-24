//
// URL.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension URL {

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

	init?(systemSetting: SystemSetting) {
		self.init(string: "x-apple.systempreferences:\(systemSetting.pane)\(systemSetting.anchor.map { "?\($0)" } ?? "")")
	}
}
