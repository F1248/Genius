//
// AdaptingTabView.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct AdaptingTabView<TabDataType: TabData>: View {

	@ObservedObject var observedSharedData: SharedData = sharedData

	var selection: Binding<Int> { Binding(
		get: { observedSharedData.selectedTabsIndexes[TabDataType.id] ?? 0 },
		set: { observedSharedData.selectedTabsIndexes[TabDataType.id] = $0 }
	) }

	var body: some View {
		if #available(macOS 15, *), TabDataType.entireWindow {
			TabView(selection: selection) {
				ForEach(TabDataType.allCases) { tab in
					Tab(
						tab.localizedStringKey,
						value: tab.index
					) { tab.content }
				}
			}
		} else {
			CustomTabView(selection: selection, entireWindow: TabDataType.entireWindow) {
				TabDataType.allCases.map { tab in
					CustomTab(
						tab.localizedStringKey,
						index: tab.index
					) { tab.content }
				}
			}
		}
	}
}
