//
//  ContentViewTab.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

enum ContentViewTab: String, CaseIterable, Identifiable {

    case home = "Home"
    case systemInformation = "System Information"
    case maintenance = "Maintenance"
    case settings = "Settings"

    var id: Self { self }
    var index: Int { Self.allCases.firstIndex(of: self)! } // swiftlint:disable:this force_unwrapping
    var localizedString: String { rawValue.localized }
    var localizedStringKey: LocalizedStringKey { LocalizedStringKey(rawValue) }

    var variesByInterfaceMode: Bool {
        switch self {
        case .systemInformation: true
        default: false
        }
    }

    var content: AnyView {
        switch self {
        case .home: AnyView(HomeView())
        case .systemInformation: AnyView(SystemInformationView())
        case .maintenance: AnyView(MaintenanceView())
        case .settings: AnyView(SettingsView())
        }
    }

    func button(viewInvalidator _: Any? = nil) -> some View {
        Button {
            sharedData.contentViewSelectedTabIndex = index
        } label: {
            Label(localizedStringKey, variesByInterfaceMode: variesByInterfaceMode)
        }
        .keyboardShortcut(self == .settings ? "," : KeyEquivalent(Character(String(index + 1))))
    }
}
