//
// © 2026 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension [String: Any] {

	init?(plist: String) {
		guard
			let newSelf = try? unsafe PropertyListSerialization.propertyList(from: Data(plist.utf8), format: nil) as? Self
		else { return nil }
		self = newSelf
	}
}
