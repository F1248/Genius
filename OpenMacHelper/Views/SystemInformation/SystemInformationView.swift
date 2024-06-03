//
//  SystemInformationView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct SystemInformationView: View {

    @AppStorage("interfaceMode")
    var interfaceMode = Settings.InterfaceMode()

    var body: some View {
        VStack {
            Text(interfaceMode.isAtLeast(.simple) ? "System Information" : "Information")
                .font(.largeTitle)
                .padding()
        }
        .frame(minWidth: 309)
        .navigationTitle("OpenMacHelper - \((interfaceMode.isAtLeast(.simple) ? "System Information" : "Information").localized)")
    }
}

#Preview {
    SystemInformationView()
}
