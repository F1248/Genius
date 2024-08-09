//
//  ContentViewLegacy.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct ContentViewLegacy: View {

    @AppStorage("interfaceMode")
    var interfaceMode = Settings.InterfaceMode()

    var body: some View {
        TabViewLegacy(entireWindow: true) {
            TabLegacy("Home") {
                HomeView()
            }
            TabLegacy(interfaceMode >= .simple ? "System Information" : "Information") {
                SystemInformationView()
            }
            TabLegacy("Maintenance") {
                MaintenanceView()
            }
            TabLegacy("Settings") {
                SettingsView()
            }
        }
        .frame(minWidth: 686, minHeight: 256)
    }
}

#Preview {
    ContentViewLegacy()
}
