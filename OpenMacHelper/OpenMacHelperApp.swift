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
            ContentView()
        }
        .commands {
            CommandGroup(replacing: .newItem) {}
            CommandGroup(replacing: .help) {}
            SidebarCommands()
        }
    }

    init() {
        NSWindow.allowsAutomaticWindowTabbing = false
    }
}
