//
//  SystemInformationView.swift
//  Genius
//
//  Created by F1248.
//

import SwiftUI
import SwiftUICore

struct SystemInformationView: View {

    var body: some View {
        VStack {
            Text("System Information", variesByInterfaceMode: true)
                .font(.largeTitle)
                .padding()
        }
    }
}

#Preview {
    SystemInformationView()
}
