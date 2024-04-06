//
//  SettingsView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct SettingsView: View {

    @AppStorage("interfaceMode")
    var interfaceMode: Settings.InterfaceMode = .normal

    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
                .padding()
            Form {
                Picker("Interface Mode:", selection: $interfaceMode) {
                    ForEach(Settings.InterfaceMode.allCases) { mode in
                        Text(mode.localized)
                    }
                }
                .pickerStyle(.inline)
            }
        }
        .frame(minWidth: 309)
        .navigationTitle("OpenMacHelper - Settings")
    }
}

#Preview {
    SettingsView()
}
