//
//  Network.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

enum Network {

    static func transferURL(_ url: String) -> String? {
        Process("/usr/bin/curl", ["--silent", "--show-error", url])?.runSafe()
    }
}
