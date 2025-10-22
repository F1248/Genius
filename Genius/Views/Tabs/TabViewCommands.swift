//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

struct TabViewCommands<TabDataType: TabData>: View {

	var body: some View {
		ForEach(TabDataType.allCases.filter { $0 as? ContentViewTab != .settings }, content: \.command)
		Divider()
	}
}
