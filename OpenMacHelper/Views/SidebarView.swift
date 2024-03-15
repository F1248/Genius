//
//  SidebarView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct SidebarView: View {

    var body: some View {
        List {
            NavigationLink {
                HomeView()
            } label: {
                Label("Home", systemImage: "house")
            }
            .keyboardShortcut("h", modifiers: [.command, .shift])
            NavigationLink {
                SettingsView()
            } label: {
                Label("Settings", systemImage:"gear")
            }
            .keyboardShortcut(",", modifiers: [.command])
        }
    }
}

#Preview {
    SidebarView()
}
