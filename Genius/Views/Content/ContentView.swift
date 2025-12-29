//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import SwiftUI

struct ContentView: View {

	@Default(.interfaceMode)
	var interfaceMode: Settings.InterfaceMode
	@Default(.developmentMode)
	var developmentMode: Bool

	var body: some View {
		AdaptingTabView<ContentViewTab>()
			.frame(minWidth: 712, minHeight: 256)
			.uninstallationDialog()
			.updateInProgressAlert()
			.id(interfaceMode)
			.id(developmentMode)
	}
}

#Preview {
	ContentView()
}
