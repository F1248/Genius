//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import CoreFoundation
import SwiftUI

struct ContentView: View {

	var body: some View {
		AdaptingTabView<ContentViewTab>()
			.frame(minWidth: 686, maxWidth: .infinity, minHeight: 256, maxHeight: .infinity)
			.uninstallationAlert()
	}
}

#Preview {
	ContentView()
}
