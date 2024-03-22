//
//  SidebarView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct SidebarView: View {

    @State private var selectedView: String? = "Home"

    var body: some View {
        List(selection: $selectedView) {
            NavigationLink {
                HomeView()
            } label: {
                Label("Home", systemImage: "house")
            }
            .tag("Home")
            .keyboardShortcut("h", modifiers: [.command, .shift])
            NavigationLink {
                SystemInformationView()
            } label: {
                Label("System Information", systemImage:"info.circle")
            }
            .keyboardShortcut("i", modifiers: [.command])
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
