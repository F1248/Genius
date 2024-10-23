//
// Int.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

extension Int {

    init?(_ string: (any StringProtocol)?) {
        guard let string else { return nil }
        self.init(string)
    }
}
