//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct TabViewButtons<TabDataType: TabData>: View {

	var body: some View {
		ForEach(TabDataType.allCases.filter { $0 as? ContentViewTab != .settings }) { tab in
			TabButton(tab: tab)
		}
		Divider()
	}
}
