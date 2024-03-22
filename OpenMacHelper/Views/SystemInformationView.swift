//
//  SystemInformationView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct SystemInformationView: View {

    @AppStorage("userMode")
    var userMode: UserMode = .averageUser

    var body: some View {
        VStack {
            Text(userMode == .noviceUser ? "Information" : "System Information")
                .font(.largeTitle)
        }
        .navigationTitle(userMode == .noviceUser ? "OpenMacHelper - Information" : "OpenMacHelper - System Information")
    }
}

#Preview {
    SystemInformationView()
}
