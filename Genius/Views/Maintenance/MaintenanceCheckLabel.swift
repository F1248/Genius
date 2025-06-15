//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import SFSafeSymbols
import SwiftUI

struct MaintenanceCheckLabel: View {

	@State var popoverPresented = false // swiftlint:disable:this explicit_type_interface

	let name: LocalizedStringKey
	let help: URL?
	let setting: URL?

	// swiftlint:disable:next type_contents_order
	init(_ name: LocalizedStringKey, help: URL?, setting: URL? = nil) {
		self.name = name
		self.help = help
		self.setting = setting
	}

	var body: some View {
		HStack {
			Text(varying: name)
			Button {
				popoverPresented.toggle()
			} label: {
				Symbol(.infoCircle, label: "Show Detail")
			}
			.buttonStyle(.borderless)
			.popover(isPresented: $popoverPresented) {
				MaintenanceCheckLabelPopover(name: name, help: help, setting: setting)
			}
		}
	}
}

#Preview {
	MaintenanceCheckLabel(
		"Name",
		help: URL(string: "https://example.com"),
		setting: URL(string: "https://example.com"),
	)
	.padding()
}
