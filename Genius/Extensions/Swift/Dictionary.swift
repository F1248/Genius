// swiftlint:disable:this file_name

//
//  Dictionary.swift
//  Genius
//
//  Created by F1248.
//

extension Optional {

    func contains<Key, Value>(key: Key) -> Bool where Wrapped == [Key: Value] {
        self?.keys.contains(key) ?? false
    }
}
