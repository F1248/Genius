//
// Toggle.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import CoreFoundation
import SwiftUI
import SwiftUICore

extension Toggle {

	init(spacedTitle titleKey: LocalizedStringKey, isOn: Binding<Bool>) where Label == AnyView {
		self.init(isOn: isOn) {
			AnyView(
				Text(titleKey)
					.frame(maxWidth: .infinity, alignment: .leading)
			)
		}
	}
}
