//
//  ViewTab.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

protocol ViewTab: RawRepresentable, CaseIterable, Identifiable, Equatable, Sendable
where AllCases: RandomAccessCollection, RawValue == String {

    var variesByInterfaceMode: Bool { get }
    var content: AnyView { get }
}

extension ViewTab {

    static var id: String { String(describing: self) }
    var id: Self { self }
    var index: Int { Self.allCases.firstIndex(of: self) as? Int ?? 0 }
    var localizedString: String { rawValue.localized(variesByInterfaceMode: variesByInterfaceMode) }
    var localizedStringKey: LocalizedStringKey { LocalizedStringKey(rawValue) }

    func button(viewInvalidator _: Any? = nil) -> some View {
        Button {
            sharedData.selectedTabsIndexes[Self.id] = index
        } label: {
            Label(localizedStringKey, variesByInterfaceMode: variesByInterfaceMode)
        }
        .keyboardShortcut(self as? ContentViewTab == .settings ? "," : KeyEquivalent(Character(String(index + 1))))
    }
}
