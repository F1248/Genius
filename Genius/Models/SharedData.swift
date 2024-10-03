//
//  SharedData.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import _Concurrency
import Foundation

class SharedData: ObservableObject {

    @Published var selectedTabsIndexes: [String: Int] = [:]
}

@MainActor let sharedData = SharedData()
