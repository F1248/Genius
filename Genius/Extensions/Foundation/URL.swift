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
}
