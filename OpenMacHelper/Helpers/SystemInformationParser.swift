//
//  SystemInformationParser.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation
import SwiftUI

func getSystemImage(modelName: String?, modelIdentifier: String?) -> String {
    switch modelName {
    case _ where modelName.hasPrefix("MacBook"):
        switch modelIdentifier {
        case "Mac14,7": "macbook.gen1"
        case _ where modelIdentifier.hasPrefix("MacBookPro18"): "macbook.gen2"
        default: modelIdentifier.hasPrefix("MacBook") ? "macbook.gen1" : "macbook.gen2"
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
    guard let serialNumber = serialNumber as? String, [11, 12].contains(serialNumber.count) else { return nil }
    let url: String = "https://support-sp.apple.com/sp/product?cc=\(serialNumber.dropFirst(8))&lang=\(Locale.currentLanguageCode ?? String())"
    guard let output = runProcess(["/usr/bin/curl", "-s", url]), output.contains("<configCode>") else { return nil }
    guard let marketingName = output.components(separatedBy: "<configCode>").last?.components(separatedBy: "</configCode>").first else { return nil }
    return LocalizedStringKey(marketingName)
}

func getOSMarketingName(_ osVersion: [Int]?) -> String? {
    switch osVersion?.first {
    case 11: "Big Sur"
    case 12: "Monterey"
    case 13: "Ventura"
    case 14: "Sonoma"
    case 15: "Sequoia"
    default: nil
    }
}
