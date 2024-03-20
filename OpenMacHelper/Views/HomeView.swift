//
//  HomeView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct HomeView: View {

    @AppStorage("userMode")
    var userMode: UserMode = .averageUser

    var body: some View {
        Text("OpenMacHelper")
            .font(.largeTitle)
        Text(LocalizedStringKey(userMode.rawValue))
            .font(.subheadline)
    }
}

#Preview {
    HomeView()
}
