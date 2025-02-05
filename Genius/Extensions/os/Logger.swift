//
// Logger.swift
// Genius
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import os

extension Logger {

	func error(
		_ message: String,
		file: String,
		line: Int,
		column: Int,
		function: String
	) {
		error("\(file):\(line):\(column) in function \(function): Error: \(message)")
	}
}
