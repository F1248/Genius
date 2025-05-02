//
// Array.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

extension [Int] {

	init?(_ strings: [some StringProtocol]?) {
		guard let map = strings?.compactMap(Int.init), map.count == strings?.count else { return nil }
		self = map
	}
}
