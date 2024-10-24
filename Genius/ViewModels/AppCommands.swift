//
// AppCommands.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct AppCommands: Commands {

	var body: some Commands {
		CommandGroup(replacing: .appSettings) {
			TabButton(tab: ContentViewTab.settings)
		}
		CommandGroup(replacing: .newItem) { EmptyView() }
		CommandGroup(before: .toolbar) {
			TabViewButtons(tabData: ContentViewTab.self)
		}
		CommandGroup(replacing: .help) { EmptyView() }
	}
}
