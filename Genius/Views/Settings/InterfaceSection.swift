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
			if
				!Defaults.Keys.disableLiquidGlass.isDefaultValue ||
				{ if #available(macOS 26, *) { Defaults[.developmentMode] || interfaceMode >= .normal } else { false } }()
			{
				SettingToggle(.disableLiquidGlass, value: $disableLiquidGlass, key: .disableLiquidGlass)
			}
			if
				!Defaults.Keys.hideIconsInMenuBar.isDefaultValue ||
				{ if #available(macOS 26, *) { Defaults[.developmentMode] || interfaceMode >= .advanced } else { false } }()
			{
				SettingToggle(.hideIconsInMenuBar, value: $hideIconsInMenuBar, key: .hideIconsInMenuBar)
					.id(disableLiquidGlass)
			}
		}
		.onChange(of: disableLiquidGlass) { _ in RelaunchDialog.present() }
		.onChange(of: hideIconsInMenuBar) { _ in RelaunchDialog.present() }
	}
}
