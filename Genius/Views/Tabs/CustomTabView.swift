//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

struct CustomTabView<TabDataType: TabData>: View {

	let selection: Binding<Int>

	var selectedTab: TabDataType? { TabDataType.allCases[safe: selection.wrappedValue] }

	@ViewBuilder var picker: some View {
		Picker(selection: selection) {
			ForEach(enumeratingID: TabDataType.allCases) { tab in
				Text(tab.title)
			}
		}
		.pickerStyle(.segmented)
	}

	var body: some View {
		if TabDataType.entireWindow {
			selectedTab
				.toolbar {
					ToolbarItem(placement: .principal) { picker }
				}
		} else {
			VStack {
				picker
					.controlSize(.large)
					.fixedSize()
				selectedTab
			}
		}
	}
}
