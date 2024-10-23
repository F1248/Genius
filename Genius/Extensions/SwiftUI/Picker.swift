//
// Picker.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

extension Picker {

	init(selection: Binding<SelectionValue>, content: () -> Content) where Label == EmptyView {
		self.init(selection: selection, content: content) { EmptyView() }
	}
}
