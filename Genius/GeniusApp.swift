//
//  GeniusApp.swift
//  Genius
//
//  Created by F1248.
//

import AppKit
import SwiftUI
import SwiftUICore

@main
struct GeniusApp: App {

    @NSApplicationDelegateAdaptor var appDelegate: AppDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
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
