//
// Toggle.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

extension Toggle {

	init(isOn: Binding<Bool>) where Label == EmptyView {
		self.init(isOn: isOn) { EmptyView() }
	}
}
