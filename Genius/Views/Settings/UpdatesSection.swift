//
// © 2026 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import Sparkle
import SwiftUI

struct UpdatesSection: View {

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

	var body: some View {
		if let automaticUpdates = Binding($automaticUpdates) {
			Section(.appUpdates) {
				SettingPicker(.automaticAppUpdates, value: automaticUpdates, defaultValue: .enabled)
					.onChange(of: self.automaticUpdates) { newValue in
						updater.automaticallyChecksForUpdates = newValue != .disabled
						updater.automaticallyDownloadsUpdates = newValue == .enabled
					}
				if
					!Defaults.Keys.betaUpdates.isDefaultValue ||
					Defaults[.developmentMode] ||
					Defaults[.interfaceMode] >= .advanced
				{
					SettingToggle(.betaUpdates, value: $betaUpdates, key: .betaUpdates)
				}
			}
		}
	}
}
