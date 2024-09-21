//
//  Tab.swift
//  Genius
//
//  Created by F1248.
//

import SwiftUI
import SwiftUICore

@available(macOS 15, *)
extension Tab where Value: Hashable, Content: View {

    init(
        _ titleKey: LocalizedStringKey,
        value: Value,
        variesByInterfaceMode: Bool = false,
        viewInvalidator _: Any? = nil,
        content: () -> Content
    ) where Label == SwiftUI.Label<Text, EmptyView> {
        self.init(value: value, content: content) {
            Label(titleKey, variesByInterfaceMode: variesByInterfaceMode)
        }
    }
}
