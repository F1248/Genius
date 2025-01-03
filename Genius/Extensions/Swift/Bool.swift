//
// Bool.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension Bool: DataInitializable {

	init?(_ data: Data) {
		switch data.first {
			case 0: self = false
			case 1: self = true
			default: return nil
		}
	}

	init?(_ string: String?) {
		guard
			let string = string.map({ $0[($0.range(of: ":", options: .backwards)?.upperBound ?? $0.startIndex)...] })?.lowercased()
		else { return nil }
		if string.contains(anyWholeWord: [
			"yes",
			"on",
			"true",
			"enabled",
		]) {
			self = true
		} else if string.contains(anyWholeWord: [
			"no",
			"off",
			"false",
			"disabled",
		]) {
			self = false
		} else { return nil }
	}
}

extension Bool? {

	static prefix func !? (bool: Self) -> Self {
		bool.map(!)
	}

	static func &&? (lhs: Self, rhs: Self) -> Self {
		if let lhs, let rhs {
			lhs && rhs
		} else if [lhs, rhs].contains(false) {
			false
		} else { nil }
	}

	static func ||? (lhs: Self, rhs: Self) -> Self {
		if let lhs, let rhs {
			lhs || rhs
		} else if [lhs, rhs].contains(true) {
			true
		} else { nil }
	}
}
