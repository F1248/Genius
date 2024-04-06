//
//  MaintenanceView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct MaintenanceView: View {

    var body: some View {
        VStack {
            Text("Maintenance")
                .font(.largeTitle)
        }
        .frame(minWidth: 309)
        .navigationTitle("OpenMacHelper - Maintenance")
    }
}

#Preview {
    MaintenanceView()
}
