// swiftlint:disable:this file_name

//
//  Dictionary.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

extension Optional {

    func contains<Key, Value>(key: Key) -> Bool where Wrapped == [Key: Value] {
        self?.keys.contains(key) ?? false
    }
}
