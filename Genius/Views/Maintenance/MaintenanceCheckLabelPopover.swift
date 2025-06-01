//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import SFSafeSymbols
import SwiftUI
import SwiftUICore

struct MaintenanceCheckLabelPopover: View {

	let name: LocalizedStringKey
	let help: URL?
	let systemSetting: URL?

	var body: some View {
		VStack(alignment: .leading) {
			Text(varying: name)
			if SystemInformation.Software.OS.bootMode.value != .recovery {
				HStack {
					Spacer(minLength: 32)
					if let help {
						Link(destination: help) {
							Symbol(.questionmarkCircle, label: "Help")
								.focusable() // Prevent symbol from receiving focus automatically
						}
						.foregroundColor(.secondary)
					}
					if let systemSetting {
						Link(destination: systemSetting) {
							Symbol(.gear, label: "Open in System Settings")
								.focusable() // Prevent symbol from receiving focus automatically
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
		systemSetting: URL(string: "https://example.com"),
	)
	.frame(width: 256)
}
