//
//  Text.swift
//  Genius
//
//  Created by F1248.
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
