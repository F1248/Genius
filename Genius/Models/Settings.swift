//
//  Settings.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

enum Settings {

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

        static var value: Self {
            // swiftformat:disable redundantProperty
            @AppStorage(key)
            var value = Self() // swiftlint:disable:this direct_return
            // swiftformat:enable redundantProperty
            return value
        }

        init() { self = .normal }
    }
}
