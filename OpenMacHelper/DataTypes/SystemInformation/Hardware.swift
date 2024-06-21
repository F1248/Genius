//
//  Hardware.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation
import SwiftUI

struct Hardware {

    let model = Model()
    struct Model {
        let name: String?
        let identifier: String?
        let number: String?
        let isAppleSilicon: Bool?
        let isLaptop: Bool
        let systemImage: String
        let marketingName: LocalizedStringKey?
    }

    let specifications = Specifications()
    struct Specifications {
        let cpu = CPU()
        struct CPU {
            let type: String?
            let speed: Measurement<UnitFrequency>?
            let cores = Cores()
            struct Cores { let total: Int?, performance: Int?, efficiency: Int? }
        }
        let memory: Measurement<UnitInformationStorage>?
    }

    let machine = Machine()
    struct Machine {
        let serialNumber: String?
        let hardwareUUID: String?
        let provisioningUDID: String?
    }
}
