//
// ContentView.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct ContentView: View {

    var body: some View {
        AdaptingTabView(tabData: ContentViewTab.self)
            .frame(minWidth: 686, minHeight: 256)
    }
}

#Preview {
    ContentView()
}
