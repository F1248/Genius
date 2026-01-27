//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

struct SettingsView: View {

	var body: some View {
		Form {
			InterfaceSection()
			UpdatesSection()
			DevelopmentSection()
		}
		.formStyle(.grouped)
		.scrollContentBackground(.hidden) // prevent background being visible with Liquid Glass disabled on macOS 26 and later
		.frame(width: 512)
	}
}

#Preview {
	SettingsView()
		.frame(width: 712, height: 256)
}
