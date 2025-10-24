//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import SwiftUI

struct SettingPicker<Value: PickerSetting>: View {

	let title: LocalizedStringResource
	let value: Binding<Value>

	// swiftlint:disable:next type_contents_order
	init(_ title: LocalizedStringResource, value: Binding<Value>) {
		self.title = title
		self.value = value
	}

	var body: some View {
		Picker(title, selection: value) {
			ForEach(Value.allCases) { option in
				Text(option.title)
			}
		}
	}
}
