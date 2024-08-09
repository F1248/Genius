//
//  Defaults.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

enum Defaults {

    static func read(_ domain: String, _ key: String) -> String? {
        Process("/usr/bin/defaults", ["read", domain, key])?.runSafe()
    }
}
