//
//  CustomTab.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import _Concurrency
import Foundation
import SwiftUICore

struct CustomTab: Hashable, Identifiable {

    let id = UUID()
    let title: VaryingText
    let index: Int
    let content: AnyView

    @MainActor
    init(
        _ titleKey: LocalizedStringKey,
        variesByInterfaceMode: Bool = false,
        index: Int,
        content: () -> any View
    ) {
        self.title = VaryingText(titleKey, variesByInterfaceMode: variesByInterfaceMode)
        self.index = index
        self.content = AnyView(content())
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
