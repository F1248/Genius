//
//  GeniusApp.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import AppKit
import SwiftUI
import SwiftUICore

@main
struct GeniusApp: App {

    @NSApplicationDelegateAdaptor var appDelegate: AppDelegate
    @AppStorage("interfaceMode")
    var interfaceMode = Settings.InterfaceMode()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowToolbarStyle(.unified(showsTitle: false))
        .commands {
            CommandGroup(replacing: .appSettings) {
                ContentViewTab.settings.button(viewInvalidator: interfaceMode)
            }
            CommandGroup(replacing: .newItem) { EmptyView() }
            CommandGroup(before: .toolbar) {
                ForEach(ContentViewTab.allCases.filter { $0 != .settings }) { tab in
                    tab.button(viewInvalidator: interfaceMode)
                }
                Divider()
            }
            CommandGroup(replacing: .help) { EmptyView() }
        }
    }

    init() {
        NSWindow.allowsAutomaticWindowTabbing = false
    }
}
