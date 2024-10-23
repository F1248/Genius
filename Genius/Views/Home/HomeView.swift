//
// HomeView.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct HomeView: View {

	var body: some View {
		VStack {
			Text("Genius")
				.font(.largeTitle)
				.padding()
			Text("Interface Mode: \(Settings.InterfaceMode.value.localizedString)")
				.font(.subheadline)
		}
	}
}

#Preview {
	HomeView()
}
