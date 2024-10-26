//
// SettingsView.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct SettingsView: View {

	@AppStorage(Settings.InterfaceMode.key)
	var interfaceMode = Settings.InterfaceMode()
	@AppStorage(Settings.DevelopmentMode.key)
	var developmentMode: Settings.DevelopmentMode.WrappedValue = Settings.DevelopmentMode.defaultValue

	var body: some View {
		Text("Settings")
			.font(.largeTitle)
			.padding()
		GroupBox {
			VStack {
				Text("Interface Mode")
				Picker(selection: $interfaceMode) {
					ForEach(Settings.InterfaceMode.allCases) { interfaceMode in
						Text(interfaceMode.localizedStringKey)
					}
				}
				.pickerStyle(.inline)
			}
			.frame(width: 512, alignment: .leading)
			if developmentMode || interfaceMode >= .powerUser {
				Divider()
				HStack {
					Text("Development Mode")
					Spacer()
					Toggle(isOn: $developmentMode)
						.toggleStyle(.switch)
				}
			}
		}
		.frame(width: 512)
	}
}

#Preview {
	SettingsView()
}
