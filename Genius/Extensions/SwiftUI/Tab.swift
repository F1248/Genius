//
//  Tab.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import _Concurrency
import SwiftUI
import SwiftUICore

@available(macOS 15, *)
extension Tab where Value: Hashable, Content: View {

    @MainActor
    init(
        _ titleKey: LocalizedStringKey,
        variesByInterfaceMode: Bool = false,
        value: Value,
        content: () -> Content
    ) where Label == SwiftUI.Label<Text, EmptyView> {
        self.init(value: value, content: content) {
            Label(titleKey, variesByInterfaceMode: variesByInterfaceMode)
        }
    }
}
