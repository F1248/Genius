//
//  ContentView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        if #available(macOS 13.0, *) {
            NavigationSplitView {
                SidebarView()
            } detail: {
                EmptyView()
            }
            .frame(minWidth: 768, minHeight: 384)
        } else {
            NavigationView {
                SidebarView()
            }
            .frame(minWidth: 768, minHeight: 384)
        }
    }
}

#Preview {
    ContentView()
}
