//
// Pasteboard.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import AppKit

enum Pasteboard {

	static func set(_ string: String) {
		let pasteboard: NSPasteboard = .general
		pasteboard.clearContents()
		pasteboard.setString(string, forType: .string)
	}
}
