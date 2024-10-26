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

	var body: some View {
		Text("Settings")
			.font(.largeTitle)
			.padding()
		GroupBox {
			VStack {
				Text("Interface Mode:")
				Picker(selection: $interfaceMode) {
					ForEach(Settings.InterfaceMode.allCases) { interfaceMode in
						Text(interfaceMode.localizedStringKey)
					}
				}
				.pickerStyle(.inline)
			}
			.frame(width: 512, alignment: .leading)
		}
		.frame(width: 512)
	}
}

#Preview {
	SettingsView()
}
