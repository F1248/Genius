//
//  Software.swift
//  OpenMacHelper
//
//  Created by F1248.
//

extension SystemInformation {

    enum Software {

        enum SMC {

            static let version: String? = SystemProfiler.hardware?["SMC_version_system"] as? String
        }

        enum Firmware {

            static let version: VersionNumber? = VersionNumber(SystemProfiler.hardware?["boot_rom_version"])
        }

        enum Kernel {

            static let components = (SystemProfiler.software?["kernel_version"] as? String)?.split(separator: " ")
            static let name: String? = String(components?[0])
            static let version: VersionNumber? = VersionNumber(components?[1])
        }

        enum Boot {

            static let volume: String? = SystemProfiler.software?["boot_volume"] as? String
            static let mode: String? = SystemProfiler.software?["boot_mode"] as? String
        }

        enum OS {

            static let components = (SystemProfiler.software?["os_version"] as? String)?.split(separator: " ")
            static let name: String? = String(components?[0])
            static let version: VersionNumber? = VersionNumber(components?[1])
            static let marketingName: String? = switch version?.major {
            case 11: "Big Sur"
            case 12: "Monterey"
            case 13: "Ventura"
            case 14: "Sonoma"
            case 15: "Sequoia"
            default: nil
            }
            static let build: String? = components?.last?.trimmingCharacters(in: .parentheses)
            static let loaderVersion: VersionNumber? = VersionNumber(SystemProfiler.hardware?["os_loader_version"])
        }

        enum Computer {

            static let name: String? = SystemProfiler.software?["local_host_name"] as? String
        }

        enum User {

            static let components = (SystemProfiler.software?["user_name"] as? String)?.split(separator: " ")
            static let name: String? = components?.dropLast().joined(separator: " ")
            static let accountName: String? = components?.last?.trimmingCharacters(in: .parentheses)
        }
    }
}
