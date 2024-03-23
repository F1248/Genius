//
//  Settings.swift
//  OpenMacHelper
//
//  Created by F1248.
//

enum InterfaceMode: String, CaseIterable, Identifiable {
    case verySimple = "Very simple"
    case simple = "Simple"
    case normal = "Normal"
    case advanced = "Advanced"
    case powerUser = "Power User"

    var id: InterfaceMode {
        return self
    }
}
