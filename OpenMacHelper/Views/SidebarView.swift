//
//  SidebarView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct SidebarView: View {

    @State private var selectedSidebarElement: SidebarElement? = .home

    @AppStorage("interfaceMode")
    var interfaceMode: InterfaceMode = .normal

    var body: some View {
        List(selection: $selectedSidebarElement) {
            NavigationLink {
                HomeView()
            } label: {
                Label("Home", systemImage: "house")
                    .font(.title2)
                    .padding(4)
            }
            .tag(SidebarElement.home)
            .keyboardShortcut("0", modifiers: [.command])
            NavigationLink {
                SystemInformationView()
            } label: {
                Label(interfaceMode.isAtLeast(.simple) ? "System Information" : "Information", systemImage:"info.circle")
                    .font(.title2)
                    .padding(4)
            }
            .tag(SidebarElement.systemInformation)
            .keyboardShortcut("1", modifiers: [.command])
            NavigationLink {
                MaintenanceView()
            } label: {
                Label("Maintenance", systemImage:"checkmark.circle")
                    .font(.title2)
                    .padding(4)
            }
            .tag(SidebarElement.maintenance)
            .keyboardShortcut("2", modifiers: [.command])
            NavigationLink {
                SettingsView()
            } label: {
                Label("Settings", systemImage:"gear")
                    .font(.title2)
                    .padding(4)
            }
            .tag(SidebarElement.settings)
            .keyboardShortcut(",", modifiers: [.command])
        }
        .frame(minWidth: 256)
    }
}

#Preview {
    SidebarView()
}
