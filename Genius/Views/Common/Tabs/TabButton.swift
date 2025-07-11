//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

struct TabButton<TabDataType: TabData>: View {

	let tab: TabDataType

	var body: some View {
		Button {
			SharedData.sharedData.selectedTabsIndices[TabDataType.id] = tab.index
		} label: {
			Label(
				tab as? ContentViewTab == .settings ? "Settings…" : tab.localizedStringKey,
				systemSymbol: tab.symbol,
			)
		}
		.keyboardShortcut(
			tab as? ContentViewTab == .settings ? "," : KeyEquivalent(Character(String(tab.index + 1))),
			modifiers: TabDataType.keyboardShortcutModifiers,
		)
	}
}
