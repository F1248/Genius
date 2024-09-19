//
//  ContentView.swift
//  Genius
//
//  Created by F1248.
//

import SwiftUI
import SwiftUICore

struct ContentView: View {

    @AppStorage("interfaceMode")
    var interfaceMode = Settings.InterfaceMode()

    var body: some View {
        if #available(macOS 15, *) {
            TabView {
                ForEach(ContentViewTabs.allCases) { tab in
                    Tab(
                        tab.localizedStringKey,
                        variesByInterfaceMode: tab.variesByInterfaceMode,
                        viewInvalidator: tab.variesByInterfaceMode ? interfaceMode : nil
                    ) { tab.content }
                }
            }
            .frame(minWidth: 686, minHeight: 256)
        } else {
            TabViewLegacy(entireWindow: true) {
                ContentViewTabs.allCases.map { tab in
                    TabLegacy(
                        tab.localizedStringKey,
                        variesByInterfaceMode: tab.variesByInterfaceMode,
                        viewInvalidator: tab.variesByInterfaceMode ? interfaceMode : nil
                    ) { tab.content }
                }
            }
            .frame(minWidth: 686, minHeight: 256)
        }
    }
}

#Preview {
    ContentView()
}
