//
//  ViewTabButton.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct ViewTabButton<T: ViewTab>: View {

    let viewTab: T
    var viewInvalidator: Any?

    var body: some View {
        Button {
            sharedData.selectedTabsIndexes[T.id] = viewTab.index
        } label: {
            Label(viewTab.localizedStringKey, variesByInterfaceMode: viewTab.variesByInterfaceMode)
        }
        .keyboardShortcut(
            viewTab as? ContentViewTab == .settings ? "," : KeyEquivalent(Character(String(viewTab.index + 1))),
            modifiers: T.keyboardShortcutModifiers
        )
    }
}
