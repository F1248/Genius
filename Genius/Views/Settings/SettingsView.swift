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
		ScrollView {
			Group {
				GroupBox {
					VStack(alignment: .leading) {
						SpacedToggle(.useTextInsteadOfSymbols, isOn: $useTextInsteadOfSymbols)
							.padding(.vertical, 2)
						Divider()
						VStack(alignment: .leading) {
							Text(.interfaceMode)
							Picker(selection: $interfaceMode) {
								ForEach(Settings.InterfaceMode.allCases) { interfaceMode in
									Text(interfaceMode.title)
								}
							}
							.pickerStyle(.inline)
							.labelsHidden()
						}
						.padding(.vertical, 2)
					}
					.padding(.horizontal, 2)
					.frame(width: 512, alignment: .leading)
				} label: {
					Text(.interface)
						.font(.title2)
						.padding()
				}
				GroupBox {
					VStack(alignment: .leading) {
						HStack {
							Text(.automaticAppUpdates)
							Spacer()
							Picker(selection: $automaticUpdates) {
								ForEach(Settings.AutomaticUpdates.allCases) { automaticUpdatesSetting in
									Text(automaticUpdatesSetting.title)
								}
							}
							.onChange(of: automaticUpdates) { newValue in
								updater.automaticallyChecksForUpdates = newValue != .disabled
								updater.automaticallyDownloadsUpdates = newValue == .enabled
							}
							.pickerStyle(.menu)
						}
						.padding(.vertical, 2)
						if betaUpdates || developmentMode || interfaceMode >= .advanced {
							Divider()
							SpacedToggle(.enableBetaUpdates, isOn: $betaUpdates)
								.padding(.vertical, 2)
						}
					}
					.padding(.horizontal, 2)
					.frame(width: 512, alignment: .leading)
				} label: {
					Text(.appUpdates)
						.font(.title2)
						.padding()
				}
				if developmentMode || interfaceMode >= .powerUser {
					GroupBox {
						VStack(alignment: .leading) {
							SpacedToggle(.developmentMode, isOn: $developmentMode)
								.padding(.vertical, 2)
						}
						.padding(.horizontal, 2)
						.frame(width: 512, alignment: .leading)
					} label: {
						Text(.development)
							.font(.title2)
							.padding()
					}
				}
			}
			.padding()
		}
	}
}

#Preview {
	SettingsView()
		.frame(width: 712, height: 256)
}
