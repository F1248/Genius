//
// MaintenanceCheckLabel.swift
// Genius
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import SFSafeSymbols
import SwiftUI
import SwiftUICore

struct MaintenanceCheckLabel: View {

	@State private var popoverPresented = false // swiftlint:disable:this explicit_type_interface

	let name: LocalizedStringKey
	let help: URL?

	// swiftlint:disable:next type_contents_order
	init(_ name: LocalizedStringKey, help: URL?) {
		self.name = name
		self.help = help
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
				MaintenanceCheckLabelPopover(name: name, help: help)
			}
		}
	}
}

#Preview {
	MaintenanceCheckLabel(
		"Name",
		help: URL(string: "https://example.com"),
	)
	.padding()
}
