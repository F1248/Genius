//
// MaintenanceCheckLabelPopover.swift
// Genius
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct MaintenanceCheckLabelPopover: View {

	let name: LocalizedStringKey

	var body: some View {
		VStack(alignment: .leading) {
			VaryingText(name)
		}
		.padding()
	}
}

#Preview {
	MaintenanceCheckLabelPopover(
		name: "Name",
	)
	.frame(width: 256)
}
