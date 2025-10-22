//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SFSafeSymbols
import SwiftUI

struct TabCommand<TabDataType: TabData>: View {

	let tab: TabDataType

	var body: some View {
		Button(
			tab as? ContentViewTab == .settings ? .settingsEllipsis : tab.title,
			systemImage: tab.symbol.rawValue,
		) {
			SharedData.shared.selectedTabsIndices[TabDataType.id] = tab.index
		}
		.keyboardShortcut(
			tab as? ContentViewTab == .settings ? "," : KeyEquivalent(Character(String(tab.index + 1))),
			modifiers: TabDataType.keyboardShortcutModifiers,
		)
	}
}
