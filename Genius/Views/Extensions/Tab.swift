//
//  Tab.swift
//  Genius
//
//  Created by F1248.
//

import SwiftUI
import SwiftUICore

extension Tab where Value == Never, Content: View, Label == SwiftUI.Label<Text, EmptyView> {

    init(
        _ titleKey: LocalizedStringKey,
        variesByInterfaceMode: Bool = false,
        viewInvalidator _: Any? = nil,
        content: () -> Content
    ) {
        self.init(content: content) {
            Label {
                Text(titleKey, variesByInterfaceMode: variesByInterfaceMode)
            } icon: {
                EmptyView()
            }
        }
    }
}
