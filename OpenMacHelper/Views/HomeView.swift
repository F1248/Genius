//
//  HomeView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct HomeView: View {

    @AppStorage("interfaceMode")
    var interfaceMode: InterfaceMode = .normal

    var body: some View {
        VStack {
            Text("OpenMacHelper")
                .font(.largeTitle)
            Text("Interface Mode: ") + Text(LocalizedStringKey(interfaceMode.rawValue))
                .font(.subheadline)
        }
        .frame(minWidth: 320)
    }
}

#Preview {
    HomeView()
}
