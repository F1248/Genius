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
            Text(interfaceMode == .verySimple ? "Information" : "System Information")
                .font(.largeTitle)
        }
        .frame(minWidth: 320)
        .navigationTitle(interfaceMode == .verySimple ? "OpenMacHelper - Information" : "OpenMacHelper - System Information")
    }
}

#Preview {
    SystemInformationView()
}
