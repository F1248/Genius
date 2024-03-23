//
//  SidebarView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct SidebarView: View {

    @State private var selectedView: String? = "Home"

    @AppStorage("interfaceMode")
    var interfaceMode: InterfaceMode = .normal

    var body: some View {
        List(selection: $selectedView) {
            NavigationLink {
                HomeView()
            } label: {
                Label("Home", systemImage: "house")
                    .font(.title2)
                    .padding(4)
            }
            .tag("Home")
            .keyboardShortcut("h", modifiers: [.command, .shift])
            NavigationLink {
                SystemInformationView()
            } label: {
                Label(interfaceMode == .verySimple ? "Information" : "System Information", systemImage:"info.circle")
                    .font(.title2)
                    .padding(4)
            }
            .keyboardShortcut("i", modifiers: [.command])
            NavigationLink {
                SettingsView()
            } label: {
                Label("Settings", systemImage:"gear")
                    .font(.title2)
                    .padding(4)
            }
            .keyboardShortcut(",", modifiers: [.command])
        }
        .frame(minWidth: 256)
    }
}

#Preview {
    SidebarView()
}
