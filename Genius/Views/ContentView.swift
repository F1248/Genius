//
//  ContentView.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct ContentView: View {

    @ObservedObject var observedSharedData: SharedData = sharedData
    @AppStorage("interfaceMode")
    var interfaceMode = Settings.InterfaceMode()

    var body: some View {
        TabView(selection: $observedSharedData.contentViewSelectedTabIndex) {
            ForEach(ContentViewTab.allCases) { tab in
                Tab(
                    tab.localizedStringKey,
                    value: tab.index,
                    variesByInterfaceMode: tab.variesByInterfaceMode,
                    viewInvalidator: tab.variesByInterfaceMode ? interfaceMode : nil
                ) { tab.content }
            }
        }
        .frame(minWidth: 686, minHeight: 256)
    }
}

#Preview {
    ContentView()
}
