//
//  Collection.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

extension Collection {}

extension Optional where Wrapped: Collection {

    var isEmpty: Bool {
        guard let self else { return true }
        return self.isEmpty
    }
}
