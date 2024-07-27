//
//  MaintenanceChecks.swift
//  OpenMacHelper
//
//  Created by F1248.
//

struct MaintenanceChecks {

    struct TheftProtection {
        let activationLock: Bool?
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
        let checkMacOSUpdates: Bool?
        let downloadMacOSUpdates: Bool?
        let installMacOSUpdates: Bool?
        let installCriticalUpdates: Bool?
        let installConfigData: Bool?
        let installAppStoreUpdates: Bool?
    }

    let theftProtection = TheftProtection()
    let dataSecurity = DataSecurity()
    let malwareProtection = MalwareProtection()
    let automaticUpdates = AutomaticUpdates()
}
