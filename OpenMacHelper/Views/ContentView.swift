//
//  ContentView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
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
        .frame(minWidth: 512, minHeight: 256)
    }
}

#Preview {
    ContentView()
}
