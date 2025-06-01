//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

extension Collection {

	subscript(safe index: Index) -> Element? {
		guard indices.contains(index) else { return nil }
		return self[index]
	}
}
