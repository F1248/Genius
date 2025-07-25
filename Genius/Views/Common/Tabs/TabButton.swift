//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SFSafeSymbols
import SwiftUI

struct TabButton<TabDataType: TabData>: View {

	let tab: TabDataType

	var body: some View {
		Button {
			SharedData.sharedData.selectedTabsIndices[TabDataType.id] = tab.index
		} label: {
			Label {
				VaryingText(tab as? ContentViewTab == .settings ? "Settings…" : tab.title)
			} icon: {
				Image(systemSymbol: tab.symbol)
					.accessibilityHidden(true)
			}
		}
		.keyboardShortcut(
			tab as? ContentViewTab == .settings ? "," : KeyEquivalent(Character(String(tab.index + 1))),
			modifiers: TabDataType.keyboardShortcutModifiers,
		)
	}
}
