//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

struct CustomTabView: View {

	let selection: Binding<Int>
	let entireWindow: Bool
	let tabs: [CustomTab]

	var selectedTab: CustomTab? { tabs[safe: selection.wrappedValue] }

	// swiftlint:disable:next type_contents_order
	init(
		selection: Binding<Int>,
		entireWindow: Bool = false,
		@CustomTabContentBuilder content: () -> [CustomTab],
	) {
		self.selection = selection
		self.entireWindow = entireWindow
		self.tabs = content()
	}

	@ViewBuilder var picker: some View {
		Picker(selection: selection) {
			ForEach(enumeratingID: tabs) { tab in
				Text(tab.title)
			}
		}
		.pickerStyle(.segmented)
	}

	var body: some View {
		if entireWindow {
			selectedTab?.content
				.toolbar {
					ToolbarItem(placement: .principal) { picker }
				}
		} else {
			VStack {
				picker
					.controlSize(.large)
					.fixedSize()
				selectedTab?.content
			}
		}
	}
}
