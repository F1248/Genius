//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

struct AdaptingTabView<TabDataType: TabData>: View {

	@ObservedObject var observedSharedData: SharedData = .shared

	var selection: Binding<Int> { $observedSharedData.selectedTabsIndices[TabDataType.id, default: 0] }

	var body: some View {
		if #available(macOS 15, *), TabDataType.entireWindow {
			TabView(selection: selection) {
				ForEach(TabDataType.allCases) { tab in
					Tab(value: tab.index) {
						tab
					} label: {
						Text(tab.title)
					}
				}
			}
		} else {
			CustomTabView(selection: selection, entireWindow: TabDataType.entireWindow) {
				TabDataType.allCases.map { tab in
					CustomTab(
						tab.title,
					) { tab }
				}
			}
		}
	}
}
