//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import SwiftUI

struct ContentView: View {

	@Default(.interfaceMode)
	var interfaceMode: Settings.InterfaceMode

	var body: some View {
		AdaptingTabView<ContentViewTab>()
			.frame(minWidth: 686, minHeight: 256)
			.uninstallationDialog()
			.id(interfaceMode)
	}
}

#Preview {
	ContentView()
}
