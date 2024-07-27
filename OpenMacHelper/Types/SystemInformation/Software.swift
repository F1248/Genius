//
//  Software.swift
//  OpenMacHelper
//
//  Created by F1248.
//

struct Software {

    struct SMC {
        let version: String?
    }

    struct Firmware {
        let version: VersionNumber?
    }

    struct Kernel {
        let name: String?
        let version: VersionNumber?
    }

    struct Boot {
        let volume: String?
        let mode: String?
    }

    struct OS {
        let name: String?
        let version: VersionNumber?
        let marketingName: String?
        let build: String?
        let loaderVersion: VersionNumber?
    }

    struct Computer {
        let name: String?
    }

    struct User {
        let name: String?
        let accountName: String?
    }

    let smc: SMC? = SystemProfiler.hardware.contains(key: "cpu_type") ? SMC() : nil
    let firmware = Firmware()
    let kernel = Kernel()
    let boot = Boot()
    let os = OS()
    let computer = Computer()
    let user = User()
}
