//
//  OpenMacHelperApp.swift
//  OpenMacHelper
//
//  Created by F1248.
//

//This is a Comment Spacing Violation!

import SwiftUI

@main
struct OpenMacHelperApp: App {

    @NSApplicationDelegateAdaptor var appDelegate: AppDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    NSWindow.allowsAutomaticWindowTabbing = false
                }
        }
        .commands {
            CommandGroup(replacing: .newItem) {}
            SidebarCommands()
        }
    }
}
