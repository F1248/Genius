//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import Foundation
import SwiftUI

struct SettingToggle: View {

	let title: LocalizedStringResource
	let value: Binding<Bool>
	let key: Defaults.Key<Bool>

	// swiftlint:disable:next type_contents_order
	init(
		_ title: LocalizedStringResource,
		value: Binding<Bool>,
		key: Defaults.Key<Bool>,
	) {
		self.title = title
		self.value = value
		self.key = key
	}

	var body: some View {
		Toggle(isOn: value) {
			HStack {
				Text(title)
				ResetSettingButton(value: value, defaultValue: key.defaultValue, reset: key.reset)
			}
		}
	}
}
