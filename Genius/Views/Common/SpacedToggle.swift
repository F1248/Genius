//
// SpacedToggle.swift
// Genius
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct SpacedToggle: View {

	let titleKey: LocalizedStringKey
	let isOn: Binding<Bool>

	// swiftlint:disable:next type_contents_order
	init(_ titleKey: LocalizedStringKey, isOn: Binding<Bool>) {
		self.titleKey = titleKey
		self.isOn = isOn
	}

	var body: some View {
		Toggle(isOn: isOn) {
			HStack {
				Text(titleKey)
				Spacer()
			}
		}
		.toggleStyle(.switch)
	}
}
