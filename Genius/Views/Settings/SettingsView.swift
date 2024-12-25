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

	@AppStorage(Defaults.Keys.interfaceMode.name)
	var interfaceMode: Settings.InterfaceMode = Defaults.Keys.interfaceMode.defaultValue
	@AppStorage(Defaults.Keys.developmentMode.name)
	var developmentMode: Bool = Defaults.Keys.developmentMode.defaultValue

	var body: some View {
		Text("Settings")
			.font(.largeTitle)
			.padding()
		GroupBox {
			VStack {
				VStack {
					Text("Interface Mode")
						.padding(.leading, 8)
						.frame(width: 512, alignment: .leading)
					Picker(selection: $interfaceMode) {
						ForEach(Settings.InterfaceMode.allCases) { interfaceMode in
							Text(LocalizedStringKey(interfaceMode.rawValue))
						}
					}
					.pickerStyle(.inline)
					.frame(width: 512, alignment: .leading)
				}
				.padding(.vertical, 2)
				if Defaults[.developmentMode] || interfaceMode >= .powerUser {
					Divider()
					Toggle(spacedTitle: "Development Mode", isOn: $developmentMode)
						.toggleStyle(.switch)
						.padding(.vertical, 2)
				}
			}
			.padding(.horizontal, 2)
		}
		.frame(width: 512)
	}
}

#Preview {
	SettingsView()
}
