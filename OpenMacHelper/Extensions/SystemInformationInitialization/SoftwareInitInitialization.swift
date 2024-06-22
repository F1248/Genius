//
//  SystemInformation.swift
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
        version = [Int](versionNumber: SystemProfiler.hardware?["boot_rom_version"])
    }
}

extension Software.Kernel {
    init() {
        let components = (SystemProfiler.software?["kernel_version"] as? String)?.components(separatedBy: " ")
        name = components?[0]
        version = [Int](versionNumber: components?[1])
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
        let components = (SystemProfiler.software?["os_version"] as? String)?.components(separatedBy: " ")
        name = components?[0]
        version = [Int](versionNumber: components?[1])
        marketingName = switch version?.first {
        case 11: "Big Sur"
        case 12: "Monterey"
        case 13: "Ventura"
        case 14: "Sonoma"
        case 15: "Sequoia"
        default: nil
        }
        build = (components?.last?.dropFirst().dropLast()).map(String.init)
        loaderVersion = [Int](versionNumber: SystemProfiler.hardware?["os_loader_version"])
    }
}

extension Software.Computer {
    init() {
        name = SystemProfiler.software?["local_host_name"] as? String
    }
}

extension Software.User {
    init() {
        let components = (SystemProfiler.software?["user_name"] as? String)?.components(separatedBy: " ")
        name = components?.dropLast().joined(separator: " ")
        accountName = components?.last?.trimmingCharacters(in: .parentheses)
    }
}
