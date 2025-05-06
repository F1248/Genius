//
// ContentView.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import CoreFoundation
import SwiftUI
import SwiftUICore

struct ContentView: View {

	@ObservedObject var observedSharedData: SharedData = sharedData

	var body: some View {
		AdaptingTabView<ContentViewTab>()
			.frame(minWidth: 686, maxWidth: .infinity, minHeight: 256, maxHeight: .infinity)
			.alert(isPresented: Binding(
				get: { observedSharedData.showUninstallAlert },
				set: { observedSharedData.showUninstallAlert = $0 },
			)) {
				Alert(
					title: Text("Are you sure you want to uninstall Genius?"),
					message: Text("Genius and all its data will be uninstalled. This action cannot be undone."),
					primaryButton: .destructive(Text("Uninstall Genius"), action: AppHelper.uninstall),
					secondaryButton: .cancel(),
				)
			}
	}
}

#Preview {
	if #available(macOS 15, *) {
		ContentView()
	} else {
		ContentView()
			.frame(width: 802, height: 256)
	}
}
