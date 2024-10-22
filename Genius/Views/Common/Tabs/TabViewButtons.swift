//
//  TabViewButtons.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct TabViewButtons<T: ViewTab>: View {

    let viewTab: T.Type

    var body: some View {
        ForEach(viewTab.allCases.filter { $0 as? ContentViewTab != .settings }) { tab in
            ViewTabButton(tab: tab)
        }
        Divider()
    }
}
