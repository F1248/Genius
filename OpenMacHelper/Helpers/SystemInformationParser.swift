//
//  SystemInformationParser.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

func getSystemImage(modelName: String?, modelIdentifier: String?) -> String {
    switch modelName {
    case _ where modelName?.contains("MacBook") ?? Bool():
        switch modelIdentifier {
        case "Mac14,7": "macbook.gen1"
        case _ where modelIdentifier?.contains("MacBookPro18") ?? Bool(): "macbook.gen2"
        default: modelIdentifier?.contains("MacBook") ?? Bool() ? "macbook.gen1" : "macbook.gen2"
        }
    case "Mac mini": "macmini"
    case "Mac Studio": "macstudio"
    case "Mac Pro":
        switch modelIdentifier {
        case "MacPro3,1", "MacPro4,1", "MacPro5,1": "macpro.gen1"
        case "MacPro6,1": "macpro.gen2"
        default: "macpro.gen3"
        }
    case "Xserve": "xserve"
    default: "desktopcomputer"
    }
}

func parseBool(_ bool: String?) -> Bool? { bool?.contains("enabled") }

func parseVersionNumber(_ versionNumber: String?) -> [Int]? { versionNumber?.components(separatedBy: ".").compactMap { Int($0) } }
