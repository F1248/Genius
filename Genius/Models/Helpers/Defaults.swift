//
// Defaults.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

enum Defaults {

    static func read(_ domain: String, _ key: String) -> String? {
        Process("/usr/bin/defaults", ["read", domain, key])?.runSafe()
    }
}
