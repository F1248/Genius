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
            Text(interfaceMode >= .simple ? "System Information" : "Information")
                .font(.largeTitle)
                .padding()
        }
    }
}

#Preview {
    SystemInformationView()
}
