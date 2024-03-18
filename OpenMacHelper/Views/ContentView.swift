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
            .frame(minWidth: 512, minHeight: 256)
        } else {
            NavigationView {
                SidebarView()
            }
            .frame(minWidth: 512, minHeight: 256)
        }
    }
}

#Preview {
    ContentView()
}
