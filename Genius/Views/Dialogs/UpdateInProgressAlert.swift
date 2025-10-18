//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

struct UpdateInProgressAlert: ViewModifier {

	@ObservedObject var observedSharedData: SharedData = .sharedData

	func body(content: Content) -> some View {
		content
			.alert(
				.updateInProgressTitle,
				isPresented: $observedSharedData.showUpdateInProgressAlert,
				actions: {},
			) {
				Text(.updateInProgressMessage)
			}
	}
}

extension View {

	func updateInProgressAlert() -> some View {
		modifier(UpdateInProgressAlert())
	}
}
