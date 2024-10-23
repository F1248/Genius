//
// TabViewButtons.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct TabViewButtons<T: TabData>: View {

    let tabData: T.Type

    var body: some View {
        ForEach(tabData.allCases.filter { $0 as? ContentViewTab != .settings }) { tab in
            TabButton(tab: tab)
        }
        Divider()
    }
}
