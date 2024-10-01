//
//  Settings.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import SwiftUICore

enum Settings {

    enum InterfaceMode: String, CaseIterable, Identifiable {

        case verySimple = "Very Simple"
        case simple = "Simple"
        case normal = "Normal"
        case advanced = "Advanced"
        case powerUser = "Power User"

        var id: Self { self }
        var localizedString: String { rawValue.localized }
        var localizedStringKey: LocalizedStringKey { LocalizedStringKey(rawValue) }
        var localizationTable: String { "Localizable\(rawValue.remove(" "))" }

        init() { self = .normal }
    }
}
