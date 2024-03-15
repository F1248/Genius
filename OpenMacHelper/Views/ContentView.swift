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
            SidebarView()
        }
        .frame(minWidth: 512, minHeight: 256)
    }
}

#Preview {
    ContentView()
}
