// swiftlint:disable:this file_name

//
//  SoftwareInitInitialization.swift
//  OpenMacHelper
//
//  Created by F1248.
//

extension Software.SMC {
    init() {
        version = SystemProfiler.hardware?["SMC_version_system"] as? String
    }
}

extension Software.Firmware {
    init() {
        version = VersionNumber(SystemProfiler.hardware?["boot_rom_version"])
    }
}

extension Software.Kernel {
    init() {
        let components = (SystemProfiler.software?["kernel_version"] as? String)?.split(separator: " ")
        name = String(components?[0])
        version = VersionNumber(components?[1])
    }
}

extension Software.Boot {
    init() {
        volume = SystemProfiler.software?["boot_volume"] as? String
        mode = SystemProfiler.software?["boot_mode"] as? String
    }
}

extension Software.OS {
    init() {
        let components = (SystemProfiler.software?["os_version"] as? String)?.split(separator: " ")
        name = String(components?[0])
        version = VersionNumber(components?[1])
        marketingName = switch version?.major {
        case 11: "Big Sur"
        case 12: "Monterey"
        case 13: "Ventura"
        case 14: "Sonoma"
        case 15: "Sequoia"
        default: nil
        }
        build = String(components?.last?.dropFirst().dropLast())
        loaderVersion = VersionNumber(SystemProfiler.hardware?["os_loader_version"])
    }
}

extension Software.Computer {
    init() {
        name = SystemProfiler.software?["local_host_name"] as? String
    }
}

extension Software.User {
    init() {
        let components = (SystemProfiler.software?["user_name"] as? String)?.split(separator: " ")
        name = components?.dropLast().joined(separator: " ")
        accountName = components?.last?.trimmingCharacters(in: .parentheses)
    }
}
