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

	@State private var selectedTabIndexPrivate = 0 // swiftlint:disable:this explicit_type_interface

	let tabs: [CustomTab]
	let selectedTabIndexParameter: Binding<Int>?

	var selectedTab: CustomTab? { tabs[safe: selectedTabIndexParameter?.wrappedValue ?? selectedTabIndexPrivate] }

	// swiftlint:disable:next type_contents_order
	init(selection: Binding<Int>? = nil, @CustomTabContentBuilder content: () -> [CustomTab]) {
		self.selectedTabIndexParameter = selection
		self.tabs = content()
	}

	var body: some View {
		VStack {
			Picker(selection: selectedTabIndexParameter ?? $selectedTabIndexPrivate) {
				ForEach(tabs) { tab in
					tab.title
						.tag(tab.index)
				}
			}
			.pickerStyle(.segmented)
			.controlSize(.large)
			.fixedSize()
			selectedTab?.content
		}
	}
}

#Preview {
	CustomTabView {
		CustomTab("Title 1", index: 0) {
			Text("Content 1")
				.padding()
		}
		CustomTab("Title 2", index: 1) {
			Text("Content 2")
				.padding()
		}
	}
	.padding()
}
