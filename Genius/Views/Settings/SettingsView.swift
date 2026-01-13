//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import Sparkle
import SwiftUI

struct SettingsView: View {

	@Default(.useTextInsteadOfSymbols)
	var useTextInsteadOfSymbols: Bool
	@Default(.interfaceMode)
	var interfaceMode: Settings.InterfaceMode
	@Default(.disableLiquidGlass)
	var disableLiquidGlass: Bool
	@Default(.hideIconsInMenuBar)
	var hideIconsInMenuBar: Bool

	@State var automaticUpdates: Settings.AutomaticUpdates? = {
		guard (SystemInformation.Software.OS.bootMode.value !=? .recovery) ?? true else { return nil }
		return if updater.automaticallyChecksForUpdates {
			if updater.automaticallyDownloadsUpdates {
				.enabled
			} else {
				.checkOnly
			}
		} else {
			.disabled
		}
	}()

	@Default(.betaUpdates)
	var betaUpdates: Bool

	@Default(.developmentMode)
	var developmentMode: Bool

	var body: some View {
		Form {
			Section(.interface) {
				SettingToggle(.useTextInsteadOfSymbols, value: $useTextInsteadOfSymbols, key: .useTextInsteadOfSymbols)
				SettingPicker(.interfaceMode, value: $interfaceMode, key: .interfaceMode)
					.pickerStyle(.inline)
				if
					!Defaults.Keys.disableLiquidGlass.isDefaultValue ||
					{ if #available(macOS 26, *) { developmentMode || interfaceMode >= .normal } else { false } }()
				{
					SettingToggle(.disableLiquidGlass, value: $disableLiquidGlass, key: .disableLiquidGlass)
						.onChange(of: disableLiquidGlass) { _ in RelaunchDialog.present() }
				}
				if
					!Defaults.Keys.hideIconsInMenuBar.isDefaultValue ||
					{ if #available(macOS 26, *) { developmentMode || interfaceMode >= .advanced } else { false } }()
				{
					SettingToggle(.hideIconsInMenuBar, value: $hideIconsInMenuBar, key: .hideIconsInMenuBar)
						.id(disableLiquidGlass)
						.onChange(of: hideIconsInMenuBar) { _ in RelaunchDialog.present() }
				}
			}
			if let automaticUpdates = Binding($automaticUpdates) {
				Section(.appUpdates) {
					SettingPicker(.automaticAppUpdates, value: automaticUpdates, defaultValue: .enabled)
						.onChange(of: self.automaticUpdates) { newValue in
							updater.automaticallyChecksForUpdates = newValue != .disabled
							updater.automaticallyDownloadsUpdates = newValue == .enabled
						}
					if !Defaults.Keys.betaUpdates.isDefaultValue || developmentMode || interfaceMode >= .advanced {
						SettingToggle(.betaUpdates, value: $betaUpdates, key: .betaUpdates)
					}
				}
			}
			if !Defaults.Keys.developmentMode.isDefaultValue || interfaceMode >= .powerUser {
				Section(.development) {
					SettingToggle(.developmentMode, value: $developmentMode, key: .developmentMode)
				}
			}
		}
		.formStyle(.grouped)
		.scrollContentBackground(.hidden) // prevent background being visible with Liquid Glass disabled on macOS 26 and later
		.frame(width: 512)
	}
}

#Preview {
	SettingsView()
		.frame(width: 712, height: 256)
}
