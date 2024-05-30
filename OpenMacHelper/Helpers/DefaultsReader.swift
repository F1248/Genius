//
//  DefaultsReader.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

func readDefault(_ domain: String, _ key: String) -> String? {
    runProcess(["/usr/bin/defaults", "read", domain, key])
}
