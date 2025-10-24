//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import SFSafeSymbols
import SwiftUI

struct ResetSettingButton<Value: Equatable>: View {

	let value: Binding<Value>
	let defaultValue: Value
	let reset: () -> Void

	var body: some View {
		if Defaults[.interfaceMode] >= .advanced, value.wrappedValue != defaultValue {
			Button(action: reset) {
				Symbol(.arrowCounterclockwise, label: .resetSetting)
			}
			.buttonStyle(.borderless)
		}
	}
}
