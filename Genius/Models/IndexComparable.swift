//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

protocol IndexComparable: Comparable where Self: Indexable, Index: Comparable {}

extension IndexComparable {

	static func < (lhs: Self, rhs: Self) -> Bool {
		lhs.index < rhs.index
	}
}
