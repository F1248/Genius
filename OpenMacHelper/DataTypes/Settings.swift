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

    var id: InterfaceMode { self }
    var localized: LocalizedStringKey { LocalizedStringKey(self.rawValue) }

    func index(_ mode: InterfaceMode) -> Int { InterfaceMode.allCases.firstIndex(of: mode)! }
    func isAtLeast(_ mode: InterfaceMode) -> Bool { index(self) >= index(mode) }
}
