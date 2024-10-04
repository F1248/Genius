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
    @AppStorage("interfaceMode")
    var interfaceMode = Settings.InterfaceMode()

    var selection: Binding<Int> { Binding(
        get: { observedSharedData.selectedTabsIndexes[viewTab.id] ?? 0 },
        set: { observedSharedData.selectedTabsIndexes[viewTab.id] = $0 }
    ) }

    var body: some View {
        TabView(selection: selection) {
            ForEach(viewTab.allCases) { tab in
                Tab(
                    tab.localizedStringKey,
                    variesByInterfaceMode: tab.variesByInterfaceMode,
                    value: tab.index,
                    viewInvalidator: tab.variesByInterfaceMode ? interfaceMode : nil
                ) { tab.content }
            }
        }
    }
}

#Preview("ContentViewTab") {
    AdaptingTabView(viewTab: ContentViewTab.self)
}
