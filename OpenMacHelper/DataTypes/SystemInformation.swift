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
            let isAppleSilicon: Bool = SystemProfiler.hardware?["chip_type"] != nil
            let isLaptop: Bool
            let systemImage: String
            let marketingName: LocalizedStringKey? = getModelMarketingName(SystemProfiler.hardware?["serial_number"])
            init() {
                isLaptop = name?.starts(with: "MacBook") ?? Bool()
                systemImage = getSystemImage(modelName: name, modelIdentifier: identifier)
            }
        }

        let specifications = Specifications()
        struct Specifications {

            let cpu = CPU()
            struct CPU {
                let type: String? = SystemProfiler.hardware?["chip_type"] as? String ?? SystemProfiler.hardware?["cpu_type"] as? String
                let speed: Measurement<UnitFrequency>? = parseFrequency(SystemProfiler.hardware?["current_processor_speed"])
            }

            let cores = Cores()
            struct Cores {
                let total: Int?, performance: Int?, efficiency: Int?
                init() {
                    if SystemProfiler.hardware?["number_processors"] is Int {
                        (total, performance, efficiency) = (SystemProfiler.hardware?["number_processors"] as? Int, nil, nil)
                    } else {
                        let components = (SystemProfiler.hardware?["number_processors"] as? String)?.replacingOccurrences(of: "proc ", with: "").components(separatedBy: ":")
                        (total, performance, efficiency) = (parseInt(components?[safe: 0]), parseInt(components?[safe: 1]), parseInt(components?[safe: 2]))
                    }
                }
            }

            let memory: Measurement<UnitInformationStorage>? = parseBytes(SystemProfiler.hardware?["physical_memory"])
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
            let version: [Int]? = parseVersionNumber(SystemProfiler.hardware?["boot_rom_version"])
        }

        let kernel = Kernel()
        struct Kernel {
            let name: String?
            let version: [Int]?
            init() {
                let components = (SystemProfiler.software?["kernel_version"] as? String)?.components(separatedBy: " ")
                name = components?[safe: 0]
                version = parseVersionNumber(components?[safe: 1])
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
            let loaderVersion: [Int]? = parseVersionNumber(SystemProfiler.hardware?["os_loader_version"])
            init() {
                let components = (SystemProfiler.software?["os_version"] as? String)?.components(separatedBy: " ")
                name = components?[safe: 0]
                version = parseVersionNumber(components?[safe: 1])
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

        let security = Security()
        struct Security {
            let activationLock: Bool? = parseBool(SystemProfiler.hardware?["activation_lock_status"])
            let hyperThreading: Bool? = parseBool(SystemProfiler.hardware?["platform_cpu_htt"])
            let secureVirtualMemory: Bool? = parseBool(SystemProfiler.software?["secure_vm"])
            let systemIntegrityProtection: Bool? = parseBool(SystemProfiler.software?["system_integrity"])
            let fileVault: Bool? = parseBool(runProcess(["/usr/bin/fdesetup", "isactive"]))
            let firewall: Bool? = parseBool(SystemProfiler.firewall?["spfirewall_globalstate"])
        }
    }
}
