//
// SystemInformationView.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct SystemInformationView: View {

	var body: some View {
		VaryingText("System Information")
			.font(.largeTitle)
			.padding()
		AdaptingTabView<SystemInformationViewTab>()
	}
}

#Preview {
	VStack {
		SystemInformationView()
	}
	.frame(width: 686, height: 256)
}
