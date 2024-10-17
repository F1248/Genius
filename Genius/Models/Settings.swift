//
//  Settings.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct Settings {

    enum InterfaceMode: String, CaseIterable, Identifiable, Setting {

        case verySimple = "Very Simple"
        case simple = "Simple"
        case normal = "Normal"
        case advanced = "Advanced"
        case powerUser = "Power User"

        static let key = "interfaceMode" // swiftlint:disable:this explicit_type_interface

        var id: Self { self }
        var localizedString: String { rawValue.localized() }
        var localizedStringKey: LocalizedStringKey { LocalizedStringKey(rawValue) }
        var localizationTable: String { "Localizable\(rawValue.remove(" "))" }

        init() { self = .normal }
    }

    @AppStorage(InterfaceMode.key)
    var interfaceMode = InterfaceMode()
}

let settings = Settings()
