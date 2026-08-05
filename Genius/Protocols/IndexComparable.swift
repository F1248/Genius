//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

protocol IndexComparable: Comparable, Indexable where Index: Comparable {}

extension IndexComparable {

	// swiftlint:disable:next unused_declaration
	static func < (lhs: Self, rhs: Self) -> Bool {
		lhs.index < rhs.index
	}
}
