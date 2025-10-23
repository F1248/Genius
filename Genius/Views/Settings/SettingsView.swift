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

	@State var automaticUpdates: Settings.AutomaticUpdates =
		if updater.automaticallyChecksForUpdates {
			if updater.automaticallyDownloadsUpdates {
				.enabled
			} else {
				.checkOnly
			}
		} else {
			.disabled
		}

	@Default(.betaUpdates)
	var betaUpdates: Bool

	@Default(.developmentMode)
	var developmentMode: Bool

	var body: some View {
		Form {
			Section(.interface) {
				Toggle(.useTextInsteadOfSymbols, isOn: $useTextInsteadOfSymbols)
				Picker(.interfaceMode, selection: $interfaceMode) {
					ForEach(Settings.InterfaceMode.allCases) { interfaceMode in
						Text(interfaceMode.title)
					}
				}
				.pickerStyle(.inline)
			}
			Section(.appUpdates) {
				Picker(.automaticAppUpdates, selection: $automaticUpdates) {
					ForEach(Settings.AutomaticUpdates.allCases) { automaticUpdatesSetting in
						Text(automaticUpdatesSetting.title)
					}
				}
				.onChange(of: automaticUpdates) { newValue in
					updater.automaticallyChecksForUpdates = newValue != .disabled
					updater.automaticallyDownloadsUpdates = newValue == .enabled
				}
				if betaUpdates || developmentMode || interfaceMode >= .advanced {
					Toggle(.enableBetaUpdates, isOn: $betaUpdates)
				}
			}
			if developmentMode || interfaceMode >= .powerUser {
				Section(.development) {
					Toggle(.developmentMode, isOn: $developmentMode)
				}
			}
		}
		.formStyle(.grouped)
		.frame(width: 512)
	}
}

#Preview {
	SettingsView()
		.frame(width: 712, height: 256)
}
