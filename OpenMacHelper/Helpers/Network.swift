//
//  Network.swift
//  OpenMacHelper
//
//  Created by F1248.
//

func transferURL(_ url: String) -> String? {
    runProcess(["/usr/bin/curl", "--silent", "--show-error", url])
}
