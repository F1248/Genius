//
// Measurement.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension Measurement {

    init?(_ string: Any?) {
        guard
            let components = (string as? String)?.split(separator: " "), components.count == 2,
            let value = Double(components.first)
        else { return nil }
        if let unit = UnitFrequency?(components.last) as? UnitType {
            self.init(value: value, unit: unit)
        } else if let unit = UnitInformationStorage?(components.last) as? UnitType {
            self.init(value: value, unit: unit)
        } else { return nil }
    }
}

extension UnitFrequency? {

    init(_ substring: Substring?) {
        self =
            switch substring {
            case "Hz": .hertz
            case "kHz": .kilohertz
            case "MHz": .megahertz
            case "GHz": .gigahertz
            default: nil
            }
    }
}

extension UnitInformationStorage? {

    init(_ substring: Substring?) {
        self =
            switch substring {
            case "B": .bytes
            case "KB": .kilobytes
            case "MB": .megabytes
            case "GB": .gigabytes
            case "TB": .terabytes
            default: nil
            }
    }
}
