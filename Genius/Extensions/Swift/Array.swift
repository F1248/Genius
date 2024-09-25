//
//  Array.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

extension Array {

    subscript(index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

extension [Int] {

    init?(_ strings: [any StringProtocol]?) {
        guard let strings else { return nil }
        self = strings.compactMap(Int.init)
        guard strings.count == count else { return nil }
    }
}
