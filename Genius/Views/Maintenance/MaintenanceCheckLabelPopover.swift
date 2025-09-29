//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import SFSafeSymbols
import SwiftUI

struct MaintenanceCheckLabelPopover: View {

	let name: LocalizedStringResource
	let help: URL?
	let setting: URL?

	var body: some View {
		VStack(alignment: .leading) {
			Text(name)
			if SystemInformation.Software.OS.bootMode.value != .recovery {
				HStack {
					Spacer(minLength: 32)
					if let help {
						Link(destination: help) {
							Symbol(.questionmarkCircle, label: .help)
						}
						.foregroundColor(.secondary)
					}
					if let setting {
						Link(destination: setting) {
							Symbol(.gear, label: .openInSystemSettings)
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
