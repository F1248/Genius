//
// URL.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension URL {

	init?(_ path: String?) {
		guard let path, FileManager.default.fileExists(atPath: path) else { return nil }
		self.init(fileURLWithPath: path)
	}
}
