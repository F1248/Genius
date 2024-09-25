//
//  Dictionary.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

extension Dictionary {}

extension Optional {

    func contains<Key, Value>(key: Key) -> Bool where Wrapped == [Key: Value] {
        self?.keys.contains(key) ?? false
    }
}
