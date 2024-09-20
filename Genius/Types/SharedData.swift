//
//  SharedData.swift
//  Genius
//
//  Created by F1248.
//

import Foundation

class SharedData: ObservableObject {

    @Published var selectedTabIndex = 0 // swiftlint:disable:this explicit_type_interface
}

nonisolated(unsafe) let sharedData = SharedData()
