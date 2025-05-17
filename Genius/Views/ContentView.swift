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
			.confirmationDialog(
				Text(varying: "Are you sure you want to uninstall Genius?"),
				isPresented: $observedSharedData.showUninstallAlert,
				actions: {
					Button(role: .destructive, action: AppHelper.uninstall) {
						Text(varying: "Uninstall Genius")
					}
				},
				message: {
					Text(varying: "Genius and all its data will be uninstalled. This action cannot be undone.")
				},
			)
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
