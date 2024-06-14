//
//  SystemInformation.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation
import SwiftUI

class SystemInformation: ObservableObject {

    @Published var hardware = Hardware()
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

    @Published var software = Software()
    struct Software {

        let smc = SMC()
        struct SMC {
            let version: String?
        }

        let firmware = Firmware()
        struct Firmware {
            let version: [Int]?
        }

        let kernel = Kernel()
        struct Kernel {
            let name: String?
            let version: [Int]?
        }

        let boot = Boot()
        struct Boot {
            let volume: String?
            let mode: String?
        }

        let os = OS()
        struct OS {
            let name: String?
            let version: [Int]?
            let marketingName: String?
            let build: String?
            let loaderVersion: [Int]?
        }

        let computer = Computer()
        struct Computer {
            let name: String?
        }

        let user = User()
        struct User {
            let name: String?
            let accountName: String?
        }
    }

    let maintenanceChecks = MaintenanceChecks()
    struct MaintenanceChecks {

        let theftProtection = TheftProtection()
        struct TheftProtection {
            let activationLock: Bool?
        }

        let dataSecurity = DataSecurity()
        struct DataSecurity {
            let fileVault: Bool?
        }

        let malwareProtection = MalwareProtection()
        struct MalwareProtection {
            let hyperThreading: Bool?
            let secureVirtualMemory: Bool?
            let systemIntegrityProtection: Bool?
            let firewall: Bool?
            let gatekeeper: Bool?
        }

        let automaticUpdates = AutomaticUpdates()
        struct AutomaticUpdates {
            let checkMacOSUpdates: Bool?
            let downloadMacOSUpdates: Bool?
            let installMacOSUpdates: Bool?
            let installCriticalUpdates: Bool?
            let installConfigData: Bool?
            let installAppStoreUpdates: Bool?
        }
    }
}
