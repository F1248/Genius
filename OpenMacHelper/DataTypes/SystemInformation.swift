//
//  SystemInformation.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import Foundation

enum SystemProfiler {
    static let hardware: [String: String] = getSystemProfiler("SPHardwareDataType")
    static let software: [String: String] = getSystemProfiler("SPSoftwareDataType")
}

class SystemInformation: ObservableObject {

    @Published var hardware = Hardware()
    struct Hardware {

        var model = Model()
        struct Model {
            var isLaptop: Bool = SystemProfiler.hardware["machine_name"]!.contains("MacBook")
            var systemImage: String = getSystemImage(modelName: SystemProfiler.hardware["machine_name"]!, modelIdentifier: SystemProfiler.hardware["machine_model"]!)
            var name: String = SystemProfiler.hardware["machine_name"]!
            var identifier: String = SystemProfiler.hardware["machine_model"]!
            var number: String = SystemProfiler.hardware["model_number"]!
        }

        var specifications = Specifications()
        struct Specifications {
            var chip: String = SystemProfiler.hardware["chip_type"]!
            var cores = Cores()
            struct Cores {
                var total: Int = Int(SystemProfiler.hardware["number_processors"]!.components(separatedBy: " ")[1].components(separatedBy: ":")[0])!
                var performance: Int = Int(SystemProfiler.hardware["number_processors"]!.components(separatedBy: " ")[1].components(separatedBy: ":")[1])!
                var efficiency: Int = Int(SystemProfiler.hardware["number_processors"]!.components(separatedBy: " ")[1].components(separatedBy: ":")[2])!
            }
            var memory: String = SystemProfiler.hardware["physical_memory"]!
        }

        var machine = Machine()
        struct Machine {
            var serialNumber: String = SystemProfiler.hardware["serial_number"]!
            var hardwareUUID: String = SystemProfiler.hardware["platform_UUID"]!
            var provisioningUDID: String = SystemProfiler.hardware["provisioning_UDID"]!
        }
    }

    @Published var software = Software()
    struct Software {

        var os = OS()
        struct OS {
            var name: String = SystemProfiler.software["os_version"]!.components(separatedBy: " ")[0]
            var version: [Int] = parseVersionNumber(SystemProfiler.software["os_version"]!.components(separatedBy: " ")[1])
            var build: String = String(SystemProfiler.software["os_version"]!.components(separatedBy: " ").last!.dropFirst().dropLast())
            var loaderVersion: [Int] = parseVersionNumber(SystemProfiler.hardware["os_loader_version"]!)
        }

        var kernel = Kernel()
        struct Kernel {
            var name: String = SystemProfiler.software["kernel_version"]!.components(separatedBy: " ")[0]
            var version: [Int] = parseVersionNumber(SystemProfiler.software["kernel_version"]!.components(separatedBy: " ")[1])
        }

        var firmware = Firmware()
        struct Firmware {
            var version: [Int] = parseVersionNumber(SystemProfiler.hardware["boot_rom_version"]!)
        }

        var boot = Boot()
        struct Boot {
            var volume: String = SystemProfiler.software["boot_volume"]!
            var mode: String = SystemProfiler.software["boot_mode"]!
        }

        var computer = Computer()
        struct Computer {
            var name: String = SystemProfiler.software["local_host_name"]!
        }

        var user = User()
        struct User {
            var name: String = String(
                SystemProfiler.software["user_name"]!.prefix(upTo: SystemProfiler.software["user_name"]!.lastIndex(of: " ")!)
            )
            var accountName: String = String(
                SystemProfiler.software["user_name"]!.components(separatedBy: " ").last!.dropFirst().dropLast()
            )
        }

        var security = Security()
        struct Security {
            var secureVirtualMemory: Bool = parseBool(SystemProfiler.software["secure_vm"]!)
            var systemIntegrityProtection: Bool = parseBool(SystemProfiler.software["system_integrity"]!)
        }
    }
}
