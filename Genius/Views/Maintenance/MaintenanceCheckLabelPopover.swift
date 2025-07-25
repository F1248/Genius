//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import SFSafeSymbols
import SwiftUI

struct MaintenanceCheckLabelPopover: View {

	let name: LocalizedStringKey
	let help: URL?
	let setting: URL?

	var body: some View {
		VStack(alignment: .leading) {
			Text(varying: name)
			if SystemInformation.Software.OS.bootMode.value != .recovery {
				HStack {
					Spacer(minLength: 32)
					if let help {
						Link(destination: help) {
							Symbol(.questionmarkCircle, label: "Help")
								.focusable() // prevent symbol from receiving focus automatically
						}
						.foregroundColor(.secondary)
					}
					if let setting {
						Link(destination: setting) {
							Symbol(.gear, label: {
								if #unavailable(macOS 13) { "Open in System Preferences" } else { "Open in System Settings" }
							}())
								.focusable() // prevent symbol from receiving focus automatically
						}
						.foregroundColor(.secondary)
					}
				}
			}
		}
		.padding()
	}
}

#Preview {
	MaintenanceCheckLabelPopover(
		name: "Name",
		help: URL(string: "https://example.com"),
		setting: URL(string: "https://example.com"),
	)
	.frame(width: 256)
}
