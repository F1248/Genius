//
//  ContentView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct ContentView: View {

    @AppStorage("userMode")
    var userMode: UserMode = .averageUser
    
    var body: some View {
        VStack {
            Text("OpenMacHelper")
                .font(.title)
            Text(userMode.rawValue)
                .font(.caption)
        }
        .frame(minWidth: 256, minHeight: 128)
    }
}

#Preview {
    ContentView()
}
