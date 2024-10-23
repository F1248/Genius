//
// Pipe.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension Pipe {

	func read() -> String? {
		String(try? fileHandleForReading.readToEnd())
	}
}
