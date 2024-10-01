//
//  TabViewLegacy.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct TabViewLegacy: View {

    let entireWindow: Bool
    let tabs: [TabLegacy]
    var selectedTabIndexParameter: Binding<Int>?

    @State private var selectedTabIndexPrivate = 0 // swiftlint:disable:this explicit_type_interface

    var selectedTab: TabLegacy { tabs[selectedTabIndexParameter?.wrappedValue ?? selectedTabIndexPrivate] }

    var picker: some View {
        Picker(selection: selectedTabIndexParameter ?? $selectedTabIndexPrivate) {
            ForEach(tabs) { tab in
                tab.title
                    .tag(tabs.firstIndex(of: tab))
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

    init(selection: Binding<Int>? = nil, entireWindow: Bool = false, @TabContentBuilder content: () -> [TabLegacy]) {
        self.selectedTabIndexParameter = selection
        self.entireWindow = entireWindow
        self.tabs = content()
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
