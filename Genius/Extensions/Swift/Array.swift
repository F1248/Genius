//
// Array.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

extension Array {}

extension [Int] {

	// periphery:ignore
	init?(_ strings: [some StringProtocol]?) {
		guard let map = strings?.map(Int.init), !map.contains(nil) else { return nil }
		self = map.compactMap(\.self)
	}
}
