//
//  Settings.swift
//  Genius
//
//  Created by F1248.
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
