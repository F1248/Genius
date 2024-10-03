//
//  Tab.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

extension Tab where Value: Hashable, Content: View {

    init(
        _ titleKey: LocalizedStringKey,
        variesByInterfaceMode: Bool = false,
        value: Value,
        viewInvalidator _: Any? = nil,
        content: () -> Content
    ) where Label == SwiftUI.Label<Text, EmptyView> {
        self.init(value: value, content: content) {
            Label(titleKey, variesByInterfaceMode: variesByInterfaceMode)
        }
    }
}
