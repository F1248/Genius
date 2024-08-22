//
//  GeniusApp.swift
//  Genius
//
//  Created by F1248.
//

import SwiftUI

@main
struct GeniusApp: App {

    @NSApplicationDelegateAdaptor var appDelegate: AppDelegate

    var body: some Scene {
        WindowGroup {
            if #available(macOS 15, *) {
                ContentView()
            } else {
                ContentViewLegacy()
            }
        }
        .windowToolbarStyle(.unified(showsTitle: false))
        .commands {
            CommandGroup(replacing: .newItem) { EmptyView() }
            CommandGroup(replacing: .help) { EmptyView() }
        }
    }

    init() {
        NSWindow.allowsAutomaticWindowTabbing = false
    }
}
