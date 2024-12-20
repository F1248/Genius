//
// Optional.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

extension Optional where Wrapped: Equatable {

	static func ==? (lhs: Self, rhs: Self) -> Bool? {
		guard let lhs, let rhs else { return nil }
		return lhs == rhs
	}

	static func !=? (lhs: Self, rhs: Self) -> Bool? {
		!?(lhs ==? rhs)
	}
}
