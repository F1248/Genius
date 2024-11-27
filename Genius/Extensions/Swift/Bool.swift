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
		guard let bool = data[0] == 0 ? false : data[0] == 1 ? true : nil else { return nil }
		self = bool
	}

	init?(_ string: Any?) {
		guard let string = string as? String else { return nil }
		if string.contains(any: [
			"1",
			"true",
			"enabled",
			"spfirewall_globalstate_limit_connections",
			"spfirewall_globalstate_block_all",
		]) {
			self = true
		} else if string.contains(any: [
			"0",
			"false",
			"disabled",
			"spfirewall_globalstate_allow_all",
		]) {
			self = false
		} else { return nil }
	}
}
