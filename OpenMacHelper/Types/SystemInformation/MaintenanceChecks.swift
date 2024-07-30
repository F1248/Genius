//
//  MaintenanceChecks.swift
//  OpenMacHelper
//
//  Created by F1248.
//

struct MaintenanceChecks {

    struct TheftProtection {
        let activationLock: Bool?
        let firmwarePassword: Bool?
    }

    struct DataSecurity {
        let fileVault: Bool?
    }

    struct MalwareProtection {
        let hyperThreading: Bool?
        let secureVirtualMemory: Bool?
        let systemIntegrityProtection: Bool?
        let firewall: Bool?
        let gatekeeper: Bool?
    }

    struct AutomaticUpdates {
        let checkMacOS: Bool?
        let downloadMacOS: Bool?
        let installMacOS: Bool?
        let installCritical: Bool?
        let installConfigData: Bool?
        let installAppStore: Bool?
    }

    let theftProtection = TheftProtection()
    let dataSecurity = DataSecurity()
    let malwareProtection = MalwareProtection()
    let automaticUpdates = AutomaticUpdates()
}
