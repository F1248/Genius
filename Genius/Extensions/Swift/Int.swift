//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension Int: DefaultInitializable, DataInitializable, UIStringRepresentable {

	var uiRepresentation: String? {
		String(self)
	}

	init(_ data: Data) {
		self = data.reversed().reduce(0) { $0 << 8 | Int($1) }
	}
}
