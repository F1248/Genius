//
//  AdaptingTabView.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct AdaptingTabView<T: TabData>: View {

    let tabData: T.Type

    @ObservedObject var observedSharedData: SharedData = sharedData

    var selection: Binding<Int> { Binding(
        get: { observedSharedData.selectedTabsIndexes[tabData.id] ?? 0 },
        set: { observedSharedData.selectedTabsIndexes[tabData.id] = $0 }
    ) }

    var body: some View {
        if #available(macOS 15, *), tabData.entireWindow {
            TabView(selection: selection) {
                ForEach(tabData.allCases) { tab in
                    Tab(
                        tab.localizedStringKey,
                        variesByInterfaceMode: tab.variesByInterfaceMode,
                        value: tab.index
                    ) { tab.content }
                }
            }
        } else {
            CustomTabView(selection: selection, entireWindow: tabData.entireWindow) {
                tabData.allCases.map { tab in
                    CustomTab(
                        tab.localizedStringKey,
                        variesByInterfaceMode: tab.variesByInterfaceMode,
                        index: tab.index
                    ) { tab.content }
                }
            }
        }
    }
}
