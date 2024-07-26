//
//  Software.swift
//  OpenMacHelper
//
//  Created by F1248.
//

struct Software {

    let smc: SMC? = SystemProfiler.hardware.contains(key: "cpu_type") ? SMC() : nil
    struct SMC {
        let version: String?
    }

    let firmware = Firmware()
    struct Firmware {
        let version: VersionNumber?
    }

    let kernel = Kernel()
    struct Kernel {
        let name: String?
        let version: VersionNumber?
    }

    let boot = Boot()
    struct Boot {
        let volume: String?
        let mode: String?
    }

    let os = OS()
    struct OS {
        let name: String?
        let version: VersionNumber?
        let marketingName: String?
        let build: String?
        let loaderVersion: VersionNumber?
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
