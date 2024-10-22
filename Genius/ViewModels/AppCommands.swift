//
//  AppCommands.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct AppCommands: Commands {

    var body: some Commands {
        CommandGroup(replacing: .appSettings) {
            ViewTabButton(tab: ContentViewTab.settings)
        }
        CommandGroup(replacing: .newItem) { EmptyView() }
        CommandGroup(before: .toolbar) {
            TabViewButtons(viewTab: ContentViewTab.self)
        }
        CommandGroup(replacing: .help) { EmptyView() }
    }
}
