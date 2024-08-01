//
//  ContentView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            if #available(macOS 13, *) {
                NavigationSplitView {
                    SidebarView()
                } detail: {
                    EmptyView()
                }
            } else {
                NavigationView {
                    SidebarView()
                }
            }
        }
        .frame(minWidth: 539, minHeight: 256)
    }
}

#Preview {
    ContentView()
}
