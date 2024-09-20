//
//  Tab.swift
//  Genius
//
//  Created by F1248.
//

import SwiftUI
import SwiftUICore

extension Tab where Value: Hashable, Content: View, Label == SwiftUI.Label<Text, EmptyView> {

    init(
        _ titleKey: LocalizedStringKey,
        value: Value,
        variesByInterfaceMode: Bool = false,
        viewInvalidator _: Any? = nil,
        content: () -> Content
    ) {
        self.init(value: value, content: content) {
            Label {
                Text(titleKey, variesByInterfaceMode: variesByInterfaceMode)
            } icon: {
                EmptyView()
            }
        }
    }
}
