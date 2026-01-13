//
// © 2026 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

protocol PresentableDialog: ViewModifier {

	var observedSharedDataProjected: ObservedObject<SharedData>.Wrapper { get }
}

extension PresentableDialog {

	var isPresented: Binding<Bool> {
		observedSharedDataProjected.presentedDialogs[ObjectIdentifier(Self.self), default: false]
	}

	static func present() {
		SharedData.shared.presentedDialogs[ObjectIdentifier(self)] = true
	}
}
