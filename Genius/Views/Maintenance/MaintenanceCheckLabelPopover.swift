//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import Foundation
import SFSafeSymbols
import SwiftUI

struct MaintenanceCheckLabelPopover: View {

	let name: LocalizedStringResource
	let help: URL?
	let setting: (any Openable)?

	var body: some View {
		VStack(alignment: .leading) {
			Text(name)
			HStack {
				Spacer(minLength: 32)
				if (SystemInformation.Software.OS.bootMode.value !=? .recovery) ?? true, let help {
					Link(destination: help) {
						Symbol(.questionmarkCircle, label: .help)
					}
					.foregroundColor(.secondary)
				}
				if let setting {
					Button {
						Task { await setting.open() }
					} label: {
						Symbol(.gear, label: .openSetting)
					}
					.buttonStyle(.plain)
					.foregroundColor(.secondary)
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
