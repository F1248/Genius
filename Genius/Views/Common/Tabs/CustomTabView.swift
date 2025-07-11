//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

struct CustomTabView: View {

	@State var selectedTabIndexPrivate: Int = 0

	let selectedTabIndexParameter: Binding<Int>?
	let entireWindow: Bool
	let tabs: [CustomTab]

	var selectedTab: CustomTab? { tabs[safe: selectedTabIndexParameter?.wrappedValue ?? selectedTabIndexPrivate] }

	// swiftlint:disable:next type_contents_order
	init(selection: Binding<Int>? = nil, entireWindow: Bool = false, @CustomTabContentBuilder content: () -> [CustomTab]) {
		self.selectedTabIndexParameter = selection
		self.entireWindow = entireWindow
		self.tabs = content()
	}

	@ViewBuilder var picker: some View {
		Picker(selection: selectedTabIndexParameter ?? $selectedTabIndexPrivate) {
			ForEach(tabs) { tab in
				tab.title
					.tag(tab.index)
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

#Preview {
	CustomTabView {
		CustomTab("Title 0", index: 0) {
			Text("Content 0")
				.padding()
		}
		CustomTab("Title 1", index: 1) {
			Text("Content 1")
				.padding()
		}
	}
	.padding()
}

#Preview("CustomTabView in entire window") {
	CustomTabView(entireWindow: true) {
		CustomTab("Title 0", index: 0) {
			Text("Content 0")
				.padding()
		}
		CustomTab("Title 1", index: 1) {
			Text("Content 1")
				.padding()
		}
	}
	.padding()
	.frame(width: 383)
}
