//
//  Defaults.swift
//  OpenMacHelper
//
//  Created by F1248.
//

enum Defaults {

    static func read(_ domain: String, _ key: String) -> String? {
        runProcess(["/usr/bin/defaults", "read", domain, key])
    }
}
