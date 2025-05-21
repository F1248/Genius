//
// NSPasteboard.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import AppKit

extension NSPasteboard {

	static func set(_ string: String) {
		general.clearContents()
		general.setString(string, forType: .string)
	}
}
