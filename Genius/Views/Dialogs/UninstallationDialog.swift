//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import AppKit
import Foundation
import SwiftUI

struct UninstallationDialog: PresentableDialog {

	@ObservedObject var observedSharedData: SharedData = .shared

	var observedSharedDataProjected: ObservedObject<SharedData>.Wrapper { $observedSharedData }

	func body(content: Content) -> some View {
		content
			.confirmationDialog(
				.uninstallationTitle,
				isPresented: isPresented,
			) {
				Button(.uninstallApp, role: .destructive) {
					guard let uninstallPath = Bundle.main.path(forResource: "Uninstall", ofType: nil) else { return }
					try? Process(uninstallPath)?.run()
					NSApp.terminate(nil)
				}
			} message: {
				Text(.uninstallationMessage)
			}
	}
}
