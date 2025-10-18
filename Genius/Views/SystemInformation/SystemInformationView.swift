//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

struct SystemInformationView: View {

	var body: some View {
		AdaptingTabView<SystemInformationViewTab>()
	}
}

#Preview {
	SystemInformationView()
		.frame(width: 712, height: 256)
}
