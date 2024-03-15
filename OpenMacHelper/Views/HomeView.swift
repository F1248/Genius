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
            .font(.title)
        Text(userMode.rawValue)
            .font(.caption)
    }
}

#Preview {
    HomeView()
}
