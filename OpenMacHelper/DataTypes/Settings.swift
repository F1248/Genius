//
//  Settings.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

enum InterfaceMode: String, CaseIterable, Identifiable {
    case verySimple = "Very simple"
    case simple = "Simple"
    case normal = "Normal"
    case advanced = "Advanced"
    case powerUser = "Power User"

    var id: InterfaceMode {
        return self
    }

    var localized: LocalizedStringKey {
        return LocalizedStringKey(self.rawValue)
    }
}
