//
//  Label.swift
//  Genius
//
//  Created by F1248.
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
