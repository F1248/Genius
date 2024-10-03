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
        if #available(macOS 15, *) {
            TabView(selection: $observedSharedData.contentViewSelectedTabIndex) {
                ForEach(ContentViewTab.allCases) { tab in
                    Tab(
                        tab.localizedStringKey,
                        variesByInterfaceMode: tab.variesByInterfaceMode,
                        value: tab.index,
                        viewInvalidator: tab.variesByInterfaceMode ? interfaceMode : nil
                    ) { tab.content }
                }
            }
            .frame(minWidth: 686, minHeight: 256)
        } else {
            TabViewLegacy(selection: $observedSharedData.contentViewSelectedTabIndex, entireWindow: true) {
                ContentViewTab.allCases.map { tab in
                    TabLegacy(
                        tab.localizedStringKey,
                        variesByInterfaceMode: tab.variesByInterfaceMode,
                        index: tab.index,
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
