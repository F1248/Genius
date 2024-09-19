//
//  ContentViewTab.swift
//  Genius
//
//  Created by F1248.
//

import SwiftUICore

enum ContentViewTab: String, CaseIterable, Identifiable {

    case home = "Home"
    case systemInformation = "System Information"
    case maintenance = "Maintenance"
    case settings = "Settings"

    var id: Self { self }
    var localizedStringKey: LocalizedStringKey { LocalizedStringKey(rawValue) }

    var content: AnyView {
        switch self {
        case .home: AnyView(HomeView())
        case .systemInformation: AnyView(SystemInformationView())
        case .maintenance: AnyView(MaintenanceView())
        case .settings: AnyView(SettingsView())
        }
    }

    var variesByInterfaceMode: Bool {
        switch self {
        case .systemInformation: true
        default: false
        }
    }
}
