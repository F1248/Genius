//
//  OSBootMode.swift
//  Genius
//
//  Created by F1248.
//

import Foundation

enum OSBootMode {

    case normal
    case safe
    case recovery

    init?(_ osBootMode: Any?) {
        if !FileManager.default.fileExists(atPath: "/System/Library/CoreServices/Finder.app") {
            self = .recovery
        } else {
            let osBootMode: Self? =
                switch osBootMode as? String {
                case "normal_boot": .normal
                case "safe_boot": .safe
                default: nil
                }
            guard let osBootMode else { return nil }
            self = osBootMode
        }
    }
}
