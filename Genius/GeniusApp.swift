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
            ContentView()
        }
        .windowToolbarStyle(.unified(showsTitle: false))
        .commands {
            CommandGroup(replacing: .newItem) {}
            CommandGroup(replacing: .help) {}
        }
    }

    init() {
        NSWindow.allowsAutomaticWindowTabbing = false
    }
}
