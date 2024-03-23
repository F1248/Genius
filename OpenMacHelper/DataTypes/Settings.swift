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

    func index(_ mode: InterfaceMode) -> Int {
        return InterfaceMode.allCases.firstIndex(of: mode)!
    }

    func isAtLeast(_ mode: InterfaceMode) -> Bool {
        return index(self) >= index(mode)
    }
}
