//
// MaintenanceCheckLabel.swift
// Genius
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SFSafeSymbols
import SwiftUI
import SwiftUICore

struct MaintenanceCheckLabel: View {

	@State private var popoverPresented = false // swiftlint:disable:this explicit_type_interface

	let name: LocalizedStringKey

	// swiftlint:disable:next type_contents_order
	init(_ name: LocalizedStringKey) {
		self.name = name
	}

	var body: some View {
		HStack {
			VaryingText(name)
			Button {
				popoverPresented.toggle()
			} label: {
				Symbol(.infoCircle, label: "Show Detail")
			}
			.buttonStyle(.borderless)
			.popover(isPresented: $popoverPresented) {
				MaintenanceCheckLabelPopover(name: name)
			}
		}
	}
}

#Preview {
	MaintenanceCheckLabel(
		"Name",
	)
	.padding()
}
