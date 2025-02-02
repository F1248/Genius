//
// Collection.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

extension Collection {

	subscript(safe index: Index?) -> Element? {
		if let index, indices.contains(index) {
			self[index]
		} else { nil }
	}
}
