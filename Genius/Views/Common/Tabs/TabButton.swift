//
// TabButton.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct TabButton<TabDataType: TabData>: View {

	let tab: TabDataType

	var body: some View {
		Button {
			sharedData.selectedTabsIndices[TabDataType.id] = tab.index
		} label: {
			VaryingText(tab.localizedStringKey)
		}
		.keyboardShortcut(
			tab as? ContentViewTab == .settings ? "," : KeyEquivalent(Character(String(tab.index + 1))),
			modifiers: TabDataType.keyboardShortcutModifiers
		)
	}
}
