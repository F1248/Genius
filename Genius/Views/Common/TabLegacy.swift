//
//  TabLegacy.swift
//  Genius
//
//  Created by F1248.
//

import SwiftUI

struct TabLegacy: Hashable, Identifiable {

    let id = UUID()
    let title: Text
    let content: AnyView

    init(_ titleKey: LocalizedStringKey, content: () -> any View) {
        self.title = Text(titleKey)
        self.content = AnyView(content())
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
