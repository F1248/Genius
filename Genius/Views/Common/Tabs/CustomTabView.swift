//
// CustomTabView.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct CustomTabView: View {

	let entireWindow: Bool
	let tabs: [CustomTab]
	let selectedTabIndexParameter: Binding<Int>?

	@State private var selectedTabIndexPrivate = 0 // swiftlint:disable:this explicit_type_interface

	var selectedTab: CustomTab? { tabs[safe: selectedTabIndexParameter?.wrappedValue ?? selectedTabIndexPrivate] }

	// swiftlint:disable:next type_contents_order
	init(selection: Binding<Int>? = nil, entireWindow: Bool = false, @CustomTabContentBuilder content: () -> [CustomTab]) {
		self.selectedTabIndexParameter = selection
		self.entireWindow = entireWindow
		self.tabs = content()
	}

	var picker: some View {
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
			picker
				.controlSize(.large)
				.fixedSize()
			selectedTab?.content
		}
	}
}

#Preview("CustomTabView in entire window") {
	CustomTabView(entireWindow: true) {
		CustomTab("Preview Title 1", index: 0) {
			Text("Preview content 1")
		}
		CustomTab("Preview Title 2", index: 1) {
			Text("Preview content 2")
		}
	}
	.frame(minWidth: 512)
}

#Preview {
	CustomTabView {
		CustomTab("Preview Title 1", index: 0) {
			Text("Preview content 1")
		}
		CustomTab("Preview Title 2", index: 1) {
			Text("Preview content 2")
		}
	}
}
