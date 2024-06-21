//
//  MaintenanceChecks.swift
//  OpenMacHelper
//
//  Created by F1248.
//

struct MaintenanceChecks {

    let theftProtection = TheftProtection()
    struct TheftProtection {
        let activationLock: Bool?
    }

    let dataSecurity = DataSecurity()
    struct DataSecurity {
        let fileVault: Bool?
    }

    let malwareProtection = MalwareProtection()
    struct MalwareProtection {
        let hyperThreading: Bool?
        let secureVirtualMemory: Bool?
        let systemIntegrityProtection: Bool?
        let firewall: Bool?
        let gatekeeper: Bool?
    }

    let automaticUpdates = AutomaticUpdates()
    struct AutomaticUpdates {
        let checkMacOSUpdates: Bool?
        let downloadMacOSUpdates: Bool?
        let installMacOSUpdates: Bool?
        let installCriticalUpdates: Bool?
        let installConfigData: Bool?
        let installAppStoreUpdates: Bool?
    }
}
