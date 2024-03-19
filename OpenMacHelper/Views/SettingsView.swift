//
//  SettingsView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct SettingsView: View {

    @AppStorage("userMode")
    var userMode: UserMode = .averageUser

    var body: some View {
        Form {
            Picker("User Mode:", selection: $userMode) {
                ForEach(UserMode.allCases) { mode in
                    Text(mode.rawValue)
                }
            }
            .pickerStyle(.inline)
        }
        .navigationTitle("OpenMacHelper Settings")
    }
}

#Preview {
    SettingsView()
}
