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
    var interfaceMode: Settings.InterfaceMode = .normal

    var body: some View {
        List(selection: $selectedSidebarElement) {
            NavigationLinkView(destination: HomeView(), title: "Home", systemImage: "house", tag: .home, keyboardShortcutKey: "0")
            NavigationLinkView(destination: SystemInformationView(), title: interfaceMode.isAtLeast(.simple) ? "System Information" : "Information", systemImage: "info.circle", tag: .systemInformation, keyboardShortcutKey: "1")
            NavigationLinkView(destination: MaintenanceView(), title: "Maintenance", systemImage: "checkmark.circle", tag: .maintenance, keyboardShortcutKey: "2")
            NavigationLinkView(destination: SettingsView(), title: "Settings", systemImage: "gear", tag: .settings, keyboardShortcutKey: ",")
        }
        .frame(minWidth: 256)
    }
}

#Preview {
    SidebarView()
}
