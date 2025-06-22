//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import AppKit
import Foundation
import SwiftUI

struct UninstallAlert: ViewModifier {

	@ObservedObject var observedSharedData: SharedData = .sharedData

	func body(content: Content) -> some View {
		content
			.confirmationDialog(
				Text(varying: "Are you sure you want to uninstall Genius?"),
				isPresented: $observedSharedData.showUninstallAlert,
			) {
				Button(role: .destructive) {
					guard let uninstallPath = Bundle.main.path(forResource: "Uninstall", ofType: nil) else { return }
					try? Process(uninstallPath)?.run()
					NSApp.terminate(nil)
				} label: {
					Text(varying: "Uninstall Genius")
				}
			} message: {
				Text(varying: "Genius and all its data will be uninstalled. This action cannot be undone.")
			}
	}
}

extension View {

	func uninstallAlert() -> some View {
		modifier(UninstallAlert())
	}
}
