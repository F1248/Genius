//
//  Dictionary.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

extension Optional {

    func containsKey<Key: Hashable, Value>(_ key: Key) -> Bool where Wrapped == [Key: Value] {
        self?.keys.contains(key) ?? Bool()
    }
}
