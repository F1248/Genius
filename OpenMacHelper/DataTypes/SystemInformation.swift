//
//  SystemInformation.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation
import SwiftUI

enum SystemProfiler {
    static let hardware: [String: String] = getSystemProfiler("SPHardwareDataType")
    static let software: [String: String] = getSystemProfiler("SPSoftwareDataType")
}

class SystemInformation: ObservableObject {

    @Published var hardware = Hardware()
    struct Hardware {

        var model = Model()
        struct Model {
            var name: String? = SystemProfiler.hardware["machine_name"]
            var identifier: String? = SystemProfiler.hardware["machine_model"]
            var number: String? = SystemProfiler.hardware["model_number"]
            var isAppleSilicon: Bool = SystemProfiler.hardware["chip_type"] != nil
            var isLaptop: Bool
            var systemImage: String
            var marketingName: LocalizedStringKey? = getModelMarketingName(SystemProfiler.hardware["serial_number"])
            init() {
                isLaptop = name?.contains("MacBook") ?? Bool()
                systemImage = getSystemImage(modelName: name, modelIdentifier: identifier)
            }
        }

        var specifications = Specifications()
        struct Specifications {
            var cpu: String? = SystemProfiler.hardware["chip_type"] ?? SystemProfiler.hardware["cpu_type"]
            var cores = Cores()
            struct Cores {
                var total: Int?, performance: Int?, efficiency: Int?
                init() {
                    let components = SystemProfiler.hardware["number_processors"]?.replacingOccurrences(of: "proc ", with: "").components(separatedBy: ":")
                    total = parseInt(components?[0])
                    if components?.count == 3 { (performance, efficiency) = (parseInt(components?[1]), parseInt(components?[2])) }
                }
            }
            var memory: String? = SystemProfiler.hardware["physical_memory"]
        }

        var machine = Machine()
        struct Machine {
            var serialNumber: String? = SystemProfiler.hardware["serial_number"]
            var hardwareUUID: String? = SystemProfiler.hardware["platform_UUID"]
            var provisioningUDID: String? = SystemProfiler.hardware["provisioning_UDID"]
        }
    }

    @Published var software = Software()
    struct Software {

        var os = OS()
        struct OS {
            var name: String?
            var version: [Int]?
            var marketingName: String?
            var build: String?
            var loaderVersion: [Int]? = parseVersionNumber(SystemProfiler.hardware["os_loader_version"])
            init() {
                let components = SystemProfiler.software["os_version"]?.components(separatedBy: " ")
                name = components?[0]
                version = parseVersionNumber(components?[1])
                marketingName = getOSMarketingName(version)
                build = (components?.last?.dropFirst().dropLast()).map(String.init)
            }
        }

        var kernel = Kernel()
        struct Kernel {
            var name: String?
            var version: [Int]?
            init() {
                let components = SystemProfiler.software["kernel_version"]?.components(separatedBy: " ")
                name = components?[0]
                version = parseVersionNumber(components?[1])
            }
        }

        var firmware = Firmware()
        struct Firmware {
            var version: [Int]? = parseVersionNumber(SystemProfiler.hardware["boot_rom_version"])
        }

        var boot = Boot()
        struct Boot {
            var volume: String? = SystemProfiler.software["boot_volume"]
            var mode: String? = SystemProfiler.software["boot_mode"]
        }

        var computer = Computer()
        struct Computer {
            var name: String? = SystemProfiler.software["local_host_name"]
        }

        var user = User()
        struct User {
            var name: String?
            var accountName: String?
            init() {
                let components = SystemProfiler.software["user_name"]?.components(separatedBy: " ")
                name = components?.dropLast().joined(separator: " ")
                accountName = (components?.last?.dropFirst().dropLast()).map(String.init)
            }
        }

        var security = Security()
        struct Security {
            var activationLock: Bool? = parseBool(SystemProfiler.hardware["activation_lock_status"])
            var secureVirtualMemory: Bool? = parseBool(SystemProfiler.software["secure_vm"])
            var systemIntegrityProtection: Bool? = parseBool(SystemProfiler.software["system_integrity"])
            var hyperThreading: Bool? = parseBool(SystemProfiler.hardware["platform_cpu_htt"])
        }
    }
}
