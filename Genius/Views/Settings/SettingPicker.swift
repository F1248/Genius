//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import Foundation
import SwiftUI

struct SettingPicker<Value: PickerSetting>: View {

	let title: LocalizedStringResource
	let value: Binding<Value>
	let defaultValue: Value
	let reset: () -> Void

	// swiftlint:disable:next type_contents_order
	init(
		_ title: LocalizedStringResource,
		value: Binding<Value>,
		key: Defaults.Key<Value>,
	) where Value: Defaults.Serializable {
		self.title = title
		self.value = value
		self.defaultValue = key.defaultValue
		self.reset = key.reset
	}

	// swiftlint:disable:next type_contents_order
	init(
		_ title: LocalizedStringResource,
		value: Binding<Value>,
		defaultValue: Value,
	) {
		self.title = title
		self.value = value
		self.defaultValue = defaultValue
		self.reset = { value.wrappedValue = defaultValue }
	}

	var body: some View {
		Picker(selection: value) {
			ForEach(Value.allCases) { option in
				Text(option.title)
			}
		} label: {
			HStack {
				Text(title)
				ResetSettingButton(value: value, defaultValue: defaultValue, reset: reset)
			}
		}
	}
}
