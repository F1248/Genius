//
//  Tab.swift
//  Genius
//
//  Created by F1248.
//

import SwiftUI
import SwiftUICore

@available(macOS 15, *)
extension Tab where Value == Never, Content: View, Label == SwiftUI.Label<Text, EmptyView> {

    init(_ titleKey: LocalizedStringKey, tableName: String? = nil, content: () -> Content) {
        self.init(content: content) {
            Label {
                Text(titleKey, tableName: tableName)
            } icon: {
                EmptyView()
            }
        }
    }
}
