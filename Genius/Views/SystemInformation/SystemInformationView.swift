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
		VaryingText("System Information", variesByInterfaceMode: true)
			.font(.largeTitle)
			.padding()
		AdaptingTabView(tabData: SystemInformationViewTab.self)
	}
}

#Preview {
	SystemInformationView()
}
