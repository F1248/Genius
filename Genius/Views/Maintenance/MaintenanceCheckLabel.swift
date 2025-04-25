//
// MaintenanceCheckLabel.swift
// Genius
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct MaintenanceCheckLabel: View {

	let name: LocalizedStringKey

	// swiftlint:disable:next type_contents_order
	init(_ name: LocalizedStringKey) {
		self.name = name
	}

	var body: some View {
		HStack {
			VaryingText(name)
		}
	}
}

#Preview {
	MaintenanceCheckLabel(
		"Name",
	)
	.padding()
}
