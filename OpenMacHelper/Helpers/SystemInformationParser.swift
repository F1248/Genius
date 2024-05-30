//
//  SystemInformationParser.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

func getSystemImage(modelName: String?, modelIdentifier: String?) -> String {
    switch modelName {
    case _ where modelName?.starts(with: "MacBook") ?? Bool():
        switch modelIdentifier {
        case "Mac14,7": "macbook.gen1"
        case _ where modelIdentifier?.starts(with: "MacBookPro18") ?? Bool(): "macbook.gen2"
        default: modelIdentifier?.starts(with: "MacBook") ?? Bool() ? "macbook.gen1" : "macbook.gen2"
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

func getModelMarketingName(_ serialNumber: Any?) -> LocalizedStringKey? {
    guard let serialNumber = serialNumber as? String else { return nil }
    if ![11, 12].contains(serialNumber.count) { return nil }
    let url: String = "https://support-sp.apple.com/sp/product?cc=\(serialNumber.dropFirst(8))&lang=\(languageCode ?? String())"
    let output = runProcess(["/usr/bin/curl", "-s", url])
    if !(output?.contains("<configCode>") ?? Bool()) { return nil }
    guard let marketingName = output?.components(separatedBy: "<configCode>").last?.components(separatedBy: "</configCode>").first else { return nil }
    return LocalizedStringKey(marketingName)
}

func getOSMarketingName(_ osVersion: [Int]?) -> String? {
    switch osVersion?.first {
    case 11: "Big Sur"
    case 12: "Monterey"
    case 13: "Ventura"
    case 14: "Sonoma"
    default: nil
    }
}

func parseBool(_ bool: Any?) -> Bool? {
    guard let bool = bool as? String else { return nil }
    if bool.contains(["enabled", "true", "1", "limit", "block"]) { return true }
    if bool.contains(["disabled", "false", "0", "allow"]) { return false }
    return nil
}

func parseInt(_ int: String?) -> Int? { Int(int ?? String()) }

func parseVersionNumber(_ versionNumber: Any?) -> [Int]? {
    (versionNumber as? String)?.components(separatedBy: ".").compactMap { Int($0) }
}

func parseFrequency(_ frequency: Any?) -> Measurement<UnitFrequency>? {
    guard let components = (frequency as? String)?.components(separatedBy: " ") else { return nil }
    guard components.count == 2 else { return nil }
    guard let firstComponent = components.first else { return nil }
    guard let value = Double(firstComponent.replacingOccurrences(of: ",", with: ".")) else { return nil }
    guard let unit: UnitFrequency = {
        switch components.last {
        case "Hz": .hertz
        case "kHz": .kilohertz
        case "MHz": .megahertz
        case "GHz": .gigahertz
        default: nil
        }
    }() else { return nil }
    return Measurement(value: value, unit: unit)
}

func parseBytes(_ bytes: Any?) -> Measurement<UnitInformationStorage>? {
    guard let components = (bytes as? String)?.components(separatedBy: " ") else { return nil }
    guard components.count == 2 else { return nil }
    guard let firstComponent = components.first else { return nil }
    guard let value = Double(firstComponent) else { return nil }
    guard let unit: UnitInformationStorage = {
        switch components.last {
        case "B": .bytes
        case "KB": .kilobytes
        case "MB": .megabytes
        case "GB": .gigabytes
        case "TB": .terabytes
        default: nil
        }
    }() else { return nil }
    return Measurement(value: value, unit: unit)
}
