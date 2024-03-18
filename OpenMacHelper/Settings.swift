//
//  Settings.swift
//  OpenMacHelper
//
//  Created by F1248.
//

enum UserMode: String, CaseIterable, Identifiable {
    case noviceUser = "Novice User"
    case averageUser = "Average User"
    case advancedUser = "Advanced User"
    case powerUser = "Power User"
    
    var id: UserMode {
        return self
    }
}
