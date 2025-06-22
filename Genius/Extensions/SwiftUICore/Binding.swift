//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

extension Binding {

	subscript<Key: Sendable, DictionaryValue: Sendable>(
		key: Key,
		default defaultValue: @escaping @Sendable @autoclosure () -> DictionaryValue,
	) -> Binding<DictionaryValue> where Value == [Key: DictionaryValue] {
		Binding<DictionaryValue>(
			get: { wrappedValue[key, default: defaultValue()] },
			set: { wrappedValue[key] = $0 },
		)
	}
}
