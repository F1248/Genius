//
//  SystemInformation.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation
import SwiftUI

enum SystemProfiler {
    static let firewall = getSystemProfiler("Firewall")
    static let hardware = getSystemProfiler("Hardware")
    static let software = getSystemProfiler("Software")
}

class SystemInformation: ObservableObject {

    @Published var hardware = Hardware()
    struct Hardware {

        let model = Model()
        struct Model {
            let name: String? = SystemProfiler.hardware?["machine_name"] as? String
            let identifier: String? = SystemProfiler.hardware?["machine_model"] as? String
            let number: String? = SystemProfiler.hardware?["model_number"] as? String
            let isAppleSilicon: Bool? = SystemProfiler.hardware?["chip_type"] != nil ? true : (SystemProfiler.hardware?["cpu_type"] != nil ? false : nil)
            let isLaptop: Bool
            let systemImage: String
            let marketingName: LocalizedStringKey? = getModelMarketingName(SystemProfiler.hardware?["serial_number"])
            init() {
                isLaptop = name.hasPrefix("MacBook")
                systemImage = getSystemImage(modelName: name, modelIdentifier: identifier)
            }
        }

        let specifications = Specifications()
        struct Specifications {

            let cpu = CPU()
            struct CPU {
                let type: String? = SystemProfiler.hardware?["chip_type"] as? String ?? SystemProfiler.hardware?["cpu_type"] as? String
                let speed: Measurement<UnitFrequency>? = Measurement(SystemProfiler.hardware?["current_processor_speed"])
                let cores = Cores()
                struct Cores {
                    let total: Int?, performance: Int?, efficiency: Int?
                    init() {
                        if SystemProfiler.hardware?["number_processors"] is Int {
                            (total, performance, efficiency) = (SystemProfiler.hardware?["number_processors"] as? Int, 0, 0)
                        } else {
                            let components = (SystemProfiler.hardware?["number_processors"] as? String)?.remove("proc ").components(separatedBy: ":")
                            (total, performance, efficiency) = (Int(components?[safe: 0]), Int(components?[safe: 1]), Int(components?[safe: 2]))
                        }
                    }
                }
            }

            let memory: Measurement<UnitInformationStorage>? = Measurement(SystemProfiler.hardware?["physical_memory"])
        }

        let machine = Machine()
        struct Machine {
            let serialNumber: String? = SystemProfiler.hardware?["serial_number"] as? String
            let hardwareUUID: String? = SystemProfiler.hardware?["platform_UUID"] as? String
            let provisioningUDID: String? = SystemProfiler.hardware?["provisioning_UDID"] as? String
        }
    }

    @Published var software = Software()
    struct Software {

        let smc = SMC()
        struct SMC {
            let version: String? = SystemProfiler.hardware?["SMC_version_system"] as? String
        }

        let firmware = Firmware()
        struct Firmware {
            let version: [Int]? = Array(versionNumber: SystemProfiler.hardware?["boot_rom_version"])
        }

        let kernel = Kernel()
        struct Kernel {
            let name: String?
            let version: [Int]?
            init() {
                let components = (SystemProfiler.software?["kernel_version"] as? String)?.components(separatedBy: " ")
                name = components?[safe: 0]
                version = Array(versionNumber: components?[safe: 1])
            }
        }

        let boot = Boot()
        struct Boot {
            let volume: String? = SystemProfiler.software?["boot_volume"] as? String
            let mode: String? = SystemProfiler.software?["boot_mode"] as? String
        }

        let os = OS()
        struct OS {
            let name: String?
            let version: [Int]?
            let marketingName: String?
            let build: String?
            let loaderVersion: [Int]? = Array(versionNumber: SystemProfiler.hardware?["os_loader_version"])
            init() {
                let components = (SystemProfiler.software?["os_version"] as? String)?.components(separatedBy: " ")
                name = components?[safe: 0]
                version = Array(versionNumber: components?[safe: 1])
                marketingName = getOSMarketingName(version)
                build = (components?.last?.dropFirst().dropLast()).map(String.init)
            }
        }

        let computer = Computer()
        struct Computer {
            let name: String? = SystemProfiler.software?["local_host_name"] as? String
        }

        let user = User()
        struct User {
            let name: String?
            let accountName: String?
            init() {
                let components = (SystemProfiler.software?["user_name"] as? String)?.components(separatedBy: " ")
                name = components?.dropLast().joined(separator: " ")
                accountName = (components?.last?.dropFirst().dropLast()).map(String.init)
            }
        }
    }

    let maintenanceChecks = MaintenanceChecks()
    struct MaintenanceChecks {

        let theftProtection = TheftProtection()
        struct TheftProtection {
            let activationLock: Bool? = Bool(SystemProfiler.hardware?["activation_lock_status"])
        }

        let dataSecurity = DataSecurity()
        struct DataSecurity {
            let fileVault: Bool? = Bool(runProcess(["/usr/bin/fdesetup", "isactive"]))
        }

        let malwareProtection = MalwareProtection()
        struct MalwareProtection {
            let hyperThreading: Bool? = Bool(SystemProfiler.hardware?["platform_cpu_htt"])
            let secureVirtualMemory: Bool? = Bool(SystemProfiler.software?["secure_vm"])
            let systemIntegrityProtection: Bool? = Bool(SystemProfiler.software?["system_integrity"])
            let firewall: Bool? = Bool(SystemProfiler.firewall?["spfirewall_globalstate"])
            let gatekeeper: Bool? = Bool(runProcess(["/usr/sbin/spctl", "--status"]))
        }

        let automaticUpdates = AutomaticUpdates()
        struct AutomaticUpdates {
            let checkMacOSUpdates: Bool? = Bool(readDefault("/Library/Preferences/com.apple.SoftwareUpdate", "AutomaticCheckEnabled"))
            let downloadMacOSUpdates: Bool? = Bool(readDefault("/Library/Preferences/com.apple.SoftwareUpdate", "AutomaticDownload"))
            let installMacOSUpdates: Bool? = Bool(readDefault("/Library/Preferences/com.apple.SoftwareUpdate", "AutomaticallyInstallMacOSUpdates"))
            let installCriticalUpdates: Bool? = Bool(readDefault("/Library/Preferences/com.apple.SoftwareUpdate", "CriticalUpdateInstall"))
            let installConfigData: Bool? = Bool(readDefault("/Library/Preferences/com.apple.SoftwareUpdate", "ConfigDataInstall"))
            let installAppStoreUpdates: Bool? = Bool(readDefault("/Library/Preferences/com.apple.commerce", "AutoUpdate"))
        }
    }
}
