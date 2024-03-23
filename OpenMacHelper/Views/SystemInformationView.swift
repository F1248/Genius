//
//  SystemInformationView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct SystemInformationView: View {

    @AppStorage("interfaceMode")
    var interfaceMode: InterfaceMode = .normal

    var body: some View {
        VStack {
            Text(interfaceMode.isAtLeast(.simple) ? "System Information" : "Information")
                .font(.largeTitle)
        }
        .frame(minWidth: 320)
        .navigationTitle(interfaceMode.isAtLeast(.verySimple) ? "OpenMacHelper - System Information" : "OpenMacHelper - Information")
    }
}

#Preview {
    SystemInformationView()
}
