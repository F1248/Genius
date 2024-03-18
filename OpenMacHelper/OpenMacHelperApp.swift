//
//  OpenMacHelperApp.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

@main
struct OpenMacHelperApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    NSWindow.allowsAutomaticWindowTabbing = false
                }
        }
    }
}
