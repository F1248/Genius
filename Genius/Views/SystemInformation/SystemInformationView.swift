//
//  SystemInformationView.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import SwiftUI
import SwiftUICore

struct SystemInformationView: View {

    var body: some View {
        VStack {
            VaryingText("System Information", variesByInterfaceMode: true)
                .font(.largeTitle)
                .padding()
        }
    }
}

#Preview {
    SystemInformationView()
}
