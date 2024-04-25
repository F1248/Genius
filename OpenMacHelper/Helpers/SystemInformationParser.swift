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

func getModelMarketingName(_ serialNumber: String?) -> LocalizedStringKey? {
    guard let serialNumber = serialNumber else { return nil }
    let url: String = "https://support-sp.apple.com/sp/product?cc=\(serialNumber.dropFirst(8))&lang=\(Locale.current.identifier)"
    let output: String = runProcess(["/usr/bin/curl", "-s", url])
    if !output.contains("<configCode>") { return nil }
    guard let marketingName: String = output.components(separatedBy: "<configCode>").last?.components(separatedBy: "</configCode>").first else { return nil }
    return LocalizedStringKey(marketingName)
}

func getOSMarketingName(_ osVersion: [Int]?) -> String? {
    switch osVersion?[0] {
    case 11: "Big Sur"
    case 12: "Monterey"
    case 13: "Ventura"
    case 14: "Sonoma"
    default: nil
    }
}

func parseBool(_ bool: String?) -> Bool? {
    guard let bool = bool else { return nil }
    if bool.contains("enabled") || bool.contains("true") { return true }
    if bool.contains("disabled") || bool.contains("false") { return false }
    return nil
}

func parseInt(_ int: String?) -> Int? { Int(int ?? String()) }

func parseVersionNumber(_ versionNumber: String?) -> [Int]? { versionNumber?.components(separatedBy: ".").compactMap { Int($0) } }
