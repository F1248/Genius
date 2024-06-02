//
//  HomeView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct HomeView: View {

    @AppStorage("interfaceMode")
    var interfaceMode: Settings.InterfaceMode = .normal

    var body: some View {
        VStack {
            Text("OpenMacHelper")
                .font(.largeTitle)
                .padding()
            Text("Interface Mode: \(interfaceMode.localized)")
                .font(.subheadline)
        }
        .frame(minWidth: 309)
    }
}

#Preview {
    HomeView()
}
