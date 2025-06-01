//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension UserDefaults {

	func read<Wrapped>(key: String, default defaultValue: Wrapped) -> Wrapped? {
		object(forKey: key) as? Wrapped ?? defaultValue
	}
}
