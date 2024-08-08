//
//  TabViewLegacy.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct TabViewLegacy: View {

    let tabs: [TabLegacy]
    @State private var selectedTab: TabLegacy

    var body: some View {
        selectedTab.content
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Picker(selection: $selectedTab) {
                        ForEach(tabs) { tab in
                            tab.title
                                .tag(tab)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
    }

    init?(@TabContentBuilder content: () -> [TabLegacy]) {
        tabs = content()
        guard let firstTab = tabs.first else { return nil }
        selectedTab = firstTab
    }
}

#Preview {
    TabViewLegacy {
        TabLegacy("Preview Title 1") {
            Text("Preview content 1")
        }
        TabLegacy("Preview Title 2") {
            Text("Preview content 2")
        }
    }
    .frame(minWidth: 512)
}
