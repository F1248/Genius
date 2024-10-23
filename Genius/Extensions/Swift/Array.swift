//
// Array.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

extension Array {}

extension [Int] {

    init?(_ strings: [any StringProtocol]?) {
        guard let map = strings?.map(Int.init), !map.contains(nil) else { return nil }
        self = map.compactMap { $0 }
    }
}
