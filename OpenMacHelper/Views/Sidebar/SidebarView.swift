//
//  SidebarView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

enum SidebarItem {

    case home, systemInformation, maintenance, settings

    init?() { self = .home }
}

struct SidebarView: View {

    @State private var selectedSidebarItem = SidebarItem()

    @AppStorage("interfaceMode")
    var interfaceMode = Settings.InterfaceMode()

    var body: some View {
        List(selection: $selectedSidebarItem) {
            SidebarItemView(destination: HomeView(), title: "Home", systemImage: "house", tag: .home, keyboardShortcutKey: "0")
            SidebarItemView(destination: SystemInformationView(), title: interfaceMode.isAtLeast(.simple) ? "System Information" : "Information", systemImage: "info.circle", tag: .systemInformation, keyboardShortcutKey: "1")
            SidebarItemView(destination: MaintenanceView(), title: "Maintenance", systemImage: "checkmark.seal", tag: .maintenance, keyboardShortcutKey: "2")
            SidebarItemView(destination: SettingsView(), title: "Settings", systemImage: "gear", tag: .settings, keyboardShortcutKey: ",")
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth: 230)
    }
}

#Preview {
    SidebarView()
}
