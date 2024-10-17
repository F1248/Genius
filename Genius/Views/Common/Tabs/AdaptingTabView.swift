//
//  AdaptingTabView.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct AdaptingTabView<T: ViewTab>: View {

    let viewTab: T.Type

    @ObservedObject var observedSharedData: SharedData = sharedData

    var selection: Binding<Int> { Binding(
        get: { observedSharedData.selectedTabsIndexes[viewTab.id] ?? 0 },
        set: { observedSharedData.selectedTabsIndexes[viewTab.id] = $0 }
    ) }

    var body: some View {
        if #available(macOS 15, *), viewTab.entireWindow {
            TabView(selection: selection) {
                ForEach(viewTab.allCases) { tab in
                    Tab(
                        tab.localizedStringKey,
                        variesByInterfaceMode: tab.variesByInterfaceMode,
                        value: tab.index
                    ) { tab.content }
                }
            }
        } else {
            CustomTabView(selection: selection, entireWindow: viewTab.entireWindow) {
                viewTab.allCases.map { tab in
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
