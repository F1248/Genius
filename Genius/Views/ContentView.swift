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
				"Are you sure you want to uninstall Genius?".localized,
				isPresented: $observedSharedData.showUninstallAlert,
				actions: {
					Button(role: .destructive, action: AppHelper.uninstall) {
						VaryingText("Uninstall Genius")
					}
				},
				message: {
					VaryingText("Genius and all its data will be uninstalled. This action cannot be undone.")
				},
			)
	}
}

#Preview {
	ContentView()
}
