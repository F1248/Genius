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
            ViewTabButton(viewTab: ContentViewTab.settings)
        }
        CommandGroup(replacing: .newItem) { EmptyView() }
        CommandGroup(before: .toolbar) {
            ForEach(ContentViewTab.allCases.filter { $0 != .settings }) { tab in
                ViewTabButton(viewTab: tab)
            }
            Divider()
        }
        CommandGroup(replacing: .help) { EmptyView() }
    }
}
