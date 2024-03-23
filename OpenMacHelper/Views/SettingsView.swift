//
//  SettingsView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct SettingsView: View {

    @AppStorage("interfaceMode")
    var interfaceMode: InterfaceMode = .normal

    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
            Form {
                Picker("Interface Mode:", selection: $interfaceMode) {
                    ForEach(InterfaceMode.allCases) { mode in
                        Text(LocalizedStringKey(mode.rawValue))
                    }
                }
                .pickerStyle(.inline)
            }
        }
        .frame(minWidth: 320)
        .navigationTitle("OpenMacHelper - Settings")
    }
}

#Preview {
    SettingsView()
}
