//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import SFSafeSymbols
import SwiftUI
import SwiftUICore

struct MaintenanceCheckLabel: View {

	@State var popoverPresented = false // swiftlint:disable:this explicit_type_interface

	let name: LocalizedStringKey
	let help: URL?
	let systemSetting: URL?

	// swiftlint:disable:next type_contents_order
	init(_ name: LocalizedStringKey, help: URL?, systemSetting: URL? = nil) {
		self.name = name
		self.help = help
		self.systemSetting = systemSetting
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
				MaintenanceCheckLabelPopover(name: name, help: help, systemSetting: systemSetting)
			}
		}
	}
}

#Preview {
	MaintenanceCheckLabel(
		"Name",
		help: URL(string: "https://example.com"),
		systemSetting: URL(string: "https://example.com"),
	)
	.padding()
}
