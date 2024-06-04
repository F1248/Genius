//
//  Measurement.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

extension Measurement {

    init?(_ string: Any?) {
        guard let components = (string as? String)?.components(separatedBy: " "), components.count == 2 else { return nil }
        guard let value = Double(components.first) else { return nil }
        if let unit = UnitFrequency?(components.last) as? UnitType {
            self.init(value: value, unit: unit)
        } else if let unit = UnitInformationStorage?(components.last) as? UnitType {
            self.init(value: value, unit: unit)
        } else { return nil }
    }
}

extension UnitFrequency? {

    init(_ string: String?) {
        self = switch string {
        case "Hz": .hertz
        case "kHz": .kilohertz
        case "MHz": .megahertz
        case "GHz": .gigahertz
        default: nil
        }
    }
}

extension UnitInformationStorage? {

    init(_ string: String?) {
        self = switch string {
        case "B": .bytes
        case "KB": .kilobytes
        case "MB": .megabytes
        case "GB": .gigabytes
        case "TB": .terabytes
        default: nil
        }
    }
}
