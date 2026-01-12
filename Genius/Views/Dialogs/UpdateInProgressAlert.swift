//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

struct UpdateInProgressAlert: PresentableDialog {

	@ObservedObject var observedSharedData: SharedData = .shared

	var observedSharedDataProjected: ObservedObject<SharedData>.Wrapper { $observedSharedData }

	func body(content: Content) -> some View {
		content
			.alert(
				.updateInProgressTitle,
				isPresented: isPresented,
				actions: {},
			) {
				Text(.updateInProgressMessage)
			}
	}
}
