//
//  ContentView.swift
//  Genius
//
//  Created by F1248.
//

import SwiftUI
import SwiftUICore

struct ContentView: View {

    @ObservedObject var observedSharedData: SharedData = sharedData
    @AppStorage("interfaceMode")
    var interfaceMode = Settings.InterfaceMode()

    var body: some View {
        TabView(selection: $observedSharedData.selectedTabIndex) {
            ForEach(ContentViewTab.allCases) { tab in
                Tab(
                    tab.localizedStringKey,
                    value: tab.tag,
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
