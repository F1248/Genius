//
//  Text.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct Text: View {

    let key: LocalizedStringKey
    let variesByInterfaceMode: Bool

    @AppStorage("interfaceMode")
    var interfaceMode = Settings.InterfaceMode()

    // swiftlint:disable:next type_contents_order
    init(_ key: LocalizedStringKey, variesByInterfaceMode: Bool = false) {
        self.key = key
        self.variesByInterfaceMode = variesByInterfaceMode
    }

    var body: some View {
        SwiftUI.Text(key, tableName: variesByInterfaceMode ? interfaceMode.localizationTable : nil)
    }
}
