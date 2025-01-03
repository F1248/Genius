//
// TabButton.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct TabButton<T: TabData>: View {

	let tab: T

	var body: some View {
		Button {
			sharedData.selectedTabsIndexes[T.id] = tab.index
		} label: {
			VaryingText(tab.localizedStringKey)
		}
		.keyboardShortcut(
			tab as? ContentViewTab == .settings ? "," : KeyEquivalent(Character(String(tab.index + 1))),
			modifiers: T.keyboardShortcutModifiers
		)
	}
}
