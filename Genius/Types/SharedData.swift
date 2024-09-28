//
//  SharedData.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import Foundation

class SharedData: ObservableObject {

    @Published var contentViewSelectedTabIndex = 0 // swiftlint:disable:this explicit_type_interface
}

nonisolated(unsafe) let sharedData = SharedData()
