//
//  OpenMacHelperApp.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

@main
struct OpenMacHelperApp: App {

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
            CommandGroup(replacing: .newItem) {}
            CommandGroup(replacing: .help) {}
        }
    }

    init() {
        NSWindow.allowsAutomaticWindowTabbing = false
    }
}
