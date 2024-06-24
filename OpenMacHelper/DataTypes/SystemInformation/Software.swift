//
//  Software.swift
//  OpenMacHelper
//
//  Created by F1248.
//

struct Software {

    let smc: SMC? = SystemProfiler.hardware?.keys.contains("cpu_type") ?? Bool() ? SMC() : nil
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
