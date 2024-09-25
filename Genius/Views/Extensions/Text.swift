//
//  Text.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

extension Text {

    init(_ key: LocalizedStringKey, variesByInterfaceMode: Bool) {
        @AppStorage("interfaceMode")
        var interfaceMode = Settings.InterfaceMode()
        self.init(key, tableName: variesByInterfaceMode ? interfaceMode.localizationTable : nil)
    }
}
