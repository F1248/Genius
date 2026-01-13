//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import AppKit
import SwiftUI

struct RelaunchDialog: PresentableDialog {

	@ObservedObject var observedSharedData: SharedData = .shared

	var observedSharedDataProjected: ObservedObject<SharedData>.Wrapper { $observedSharedData }

	func body(content: Content) -> some View {
		content
			.confirmationDialog(
				.relaunchTitle,
				isPresented: isPresented,
			) {
				Button(.relaunchGenius) {
					Task(operation: NSApp.relaunch)
				}
				Button(.later, role: .cancel, action: {})
			}
	}
}
