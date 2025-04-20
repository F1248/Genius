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
		Text("Genius")
			.font(.largeTitle)
			.padding()
	}
}

#Preview {
	VStack {
		HomeView()
	}
	.frame(width: 686, height: 256)
}
