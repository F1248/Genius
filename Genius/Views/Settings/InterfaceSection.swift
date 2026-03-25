//
// © 2026 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import SwiftUI

struct InterfaceSection: View {

	@Default(.useTextInsteadOfSymbols)
	var useTextInsteadOfSymbols: Bool
	@Default(.interfaceMode)
	var interfaceMode: Settings.InterfaceMode
	@Default(.disableLiquidGlass)
	var disableLiquidGlass: Bool
	@Default(.hideIconsInMenuBar)
	var hideIconsInMenuBar: Bool

	var body: some View {
		Section(.interface) {
			SettingToggle(.useTextInsteadOfSymbols, value: $useTextInsteadOfSymbols, key: .useTextInsteadOfSymbols)
			SettingPicker(.interfaceMode, value: $interfaceMode, key: .interfaceMode)
				.pickerStyle(.inline)
			SettingToggle(
				.disableLiquidGlass,
				value: $disableLiquidGlass,
				key: .disableLiquidGlass,
				if: { if #available(macOS 26, *) { interfaceMode >= .normal } else { false } }(),
			)
			.onChange(of: disableLiquidGlass) { _ in RelaunchDialog.present() }
			SettingToggle(
				.hideIconsInMenuBar,
				value: $hideIconsInMenuBar,
				key: .hideIconsInMenuBar,
				if: { if #available(macOS 26, *) { interfaceMode >= .advanced } else { false } }(),
			)
			.id(disableLiquidGlass)
			.onChange(of: hideIconsInMenuBar) { _ in RelaunchDialog.present() }
		}
	}
}
