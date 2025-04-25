//
// SettingsView.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import SwiftUI
import SwiftUICore

struct SettingsView: View {

	@Default(.useTextInsteadOfSymbols)
	var useTextInsteadOfSymbols: Bool
	@Default(.interfaceMode)
	var interfaceMode: Settings.InterfaceMode
	@Default(.developmentMode)
	var developmentMode: Bool

	var body: some View {
		VStack {
			Text("Settings")
				.font(.largeTitle)
				.padding()
			ScrollView {
				GroupBox {
					VStack(alignment: .leading) {
						SpacedToggle("Use Text Instead of Symbols", isOn: $useTextInsteadOfSymbols)
							.padding(.vertical, 2)
						Divider()
						VStack(alignment: .leading) {
							Text("Interface Mode")
							Picker(selection: $interfaceMode) {
								ForEach(Settings.InterfaceMode.allCases) { interfaceMode in
									Text(LocalizedStringKey(interfaceMode.rawValue))
								}
							}
							.pickerStyle(.inline)
							.labelsHidden()
						}
						.padding(.vertical, 2)
						if developmentMode || interfaceMode >= .powerUser {
							Divider()
							SpacedToggle("Development Mode", isOn: $developmentMode)
								.padding(.vertical, 2)
						}
					}
					.padding(.horizontal, 2)
				}
				.frame(maxWidth: 512)
				.padding()
			}
		}
	}
}

#Preview {
	SettingsView()
		.frame(width: 686, height: 256)
}
