//
//  Label.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

extension Label {

    init(_ titleKey: LocalizedStringKey, variesByInterfaceMode: Bool = false) where Title == Text, Icon == EmptyView {
        self.init {
            Text(titleKey, variesByInterfaceMode: variesByInterfaceMode)
        } icon: {
            EmptyView()
        }
    }
}
