//
//  HomeView.swift
//  Genius
//
//  Created by F1248.
//

import SwiftUI
import SwiftUICore

struct HomeView: View {

    @AppStorage("interfaceMode")
    var interfaceMode = Settings.InterfaceMode()

    var body: some View {
        VStack {
            Text("Genius")
                .font(.largeTitle)
                .padding()
            Text("Interface Mode: \(interfaceMode.localizedString)")
                .font(.subheadline)
        }
    }
}

#Preview {
    HomeView()
}
