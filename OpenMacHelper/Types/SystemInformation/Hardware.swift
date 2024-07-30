//
//  Hardware.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation
import SwiftUI

struct Hardware {

    struct Model {
        let name: String?
        let identifier: String?
        let number: String?
        let isAppleSilicon: Bool?
        let isLaptop: Bool
        let systemImage: String
        let marketingName: LocalizedStringKey?
    }

    struct Specifications {
        let cpu = CPU()
        struct CPU {
            let type: String?
            let speed: Measurement<UnitFrequency>?
            let cores = Cores()
            struct Cores {
                let total: Int?
                let performance: Int?
                let efficiency: Int?
            }
        }
        let memory: Measurement<UnitInformationStorage>?
    }

    struct Machine {
        let serialNumber: String?
        let hardwareUUID: String?
        let provisioningUDID: String?
    }

    let model = Model()
    let specifications = Specifications()
    let machine = Machine()
}
