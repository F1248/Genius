//
//  TabViewLegacy.swift
//  Genius
//
//  Created by F1248.
//

import SwiftUI

struct TabViewLegacy: View {

    let entireWindow: Bool
    let tabs: [TabLegacy]

    @State private var selectedTab: TabLegacy

    // swiftlint:disable:next type_contents_order
    init?(entireWindow: Bool = false, @TabContentBuilder content: () -> [TabLegacy]) {
        self.entireWindow = entireWindow
        self.tabs = content()
        guard let firstTab = tabs.first else { return nil }
        self.selectedTab = firstTab
    }

    var picker: some View {
        Picker(selection: $selectedTab) {
            ForEach(tabs) { tab in
                tab.title
                    .tag(tab)
            }
        }
        .pickerStyle(.segmented)
    }

    var body: some View {
        if entireWindow {
            selectedTab.content
                .toolbar {
                    ToolbarItem(placement: .principal) { picker }
                }
        } else {
            picker
                .controlSize(.large)
                .fixedSize()
            selectedTab.content
        }
    }
}

#Preview("TabViewLegacy in entire window") {
    TabViewLegacy(entireWindow: true) {
        TabLegacy("Preview Title 1") {
            Text("Preview content 1")
        }
        TabLegacy("Preview Title 2") {
            Text("Preview content 2")
        }
    }
    .frame(minWidth: 512)
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
}
