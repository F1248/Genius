//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

struct ContentView: View {

	var body: some View {
		AdaptingTabView<ContentViewTab>()
			.frame(minWidth: 686, minHeight: 256)
			.uninstallationAlert()
	}
}

#Preview {
	ContentView()
}
