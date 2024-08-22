//
//  ContentView.swift
//  Genius
//
//  Created by F1248.
//

import SwiftUI

@available(macOS 15, *)
struct ContentView: View {

    @AppStorage("interfaceMode")
    var interfaceMode = Settings.InterfaceMode()

    var body: some View {
        TabView {
            Tab("Home") {
                HomeView()
            }
            Tab(interfaceMode >= .simple ? "System Information" : "Information") {
                SystemInformationView()
            }
            Tab("Maintenance") {
                MaintenanceView()
            }
            Tab("Settings") {
                SettingsView()
            }
        }
        .frame(minWidth: 686, minHeight: 256)
    }
}

@available(macOS 15, *)
#Preview {
    ContentView()
}
