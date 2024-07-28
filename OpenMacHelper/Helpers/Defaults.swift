//
//  Defaults.swift
//  OpenMacHelper
//
//  Created by F1248.
//

func readDefault(_ domain: String, _ key: String) -> String? {
    runProcess(["/usr/bin/defaults", "read", domain, key])
}
