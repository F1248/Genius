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
			.alert(isPresented: $observedSharedData.showUninstallAlert) {
				Alert(
					title: Text("Are you sure you want to uninstall Genius?".localized),
					message: Text("Genius and all its data will be uninstalled. This action cannot be undone.".localized),
					primaryButton: .destructive(Text("Uninstall Genius".localized), action: AppHelper.uninstall),
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
