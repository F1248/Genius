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
        VStack {
            Text("Settings")
                .font(.largeTitle)
            Form {
                Picker("User Mode:", selection: $userMode) {
                    ForEach(UserMode.allCases) { mode in
                        Text(LocalizedStringKey(mode.rawValue))
                    }
                }
                .pickerStyle(.inline)
            }
        }
        .navigationTitle("OpenMacHelper - Settings")
    }
}

#Preview {
    SettingsView()
}
