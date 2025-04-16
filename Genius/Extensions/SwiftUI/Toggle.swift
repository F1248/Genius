//
// Toggle.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import SwiftUI
import SwiftUICore

extension Toggle {

	@MainActor
	init(spacedTitle titleKey: LocalizedStringKey, isOn: Binding<Bool>) where Label == HStack<TupleView<(Text, Spacer)>> {
		self.init(isOn: isOn) {
			HStack {
				Text(titleKey)
				Spacer()
			}
		}
	}
}
