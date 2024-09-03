//
//  Tab.swift
//  Genius
//
//  Created by F1248.
//

import SwiftUI
import SwiftUICore

@available(macOS 15, *)
extension Tab where Value == Never, Content: View {

    init(_ titleKey: LocalizedStringKey, content: () -> Content) where Label == DefaultTabLabel {
        self.init(titleKey, systemImage: "", content: content)
    }
}
