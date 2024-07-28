// swiftlint:disable:this file_name

//
//  MaintenanceChecksInitialization.swift
//  OpenMacHelper
//
//  Created by F1248.
//

extension MaintenanceChecks.TheftProtection {
    init() {
        activationLock = Bool(SystemProfiler.hardware?["activation_lock_status"])
    }
}

extension MaintenanceChecks.DataSecurity {
    init() {
        fileVault = Bool(runProcess(["/usr/bin/fdesetup", "isactive"]))
    }
}

extension MaintenanceChecks.MalwareProtection {
    init() {
        hyperThreading = SystemProfiler.hardware.contains(key: "cpu_type") ? Bool(SystemProfiler.hardware?["platform_cpu_htt"]) : nil
        secureVirtualMemory = Bool(SystemProfiler.software?["secure_vm"])
        systemIntegrityProtection = Bool(SystemProfiler.software?["system_integrity"])
        firewall = Bool(SystemProfiler.firewall?["spfirewall_globalstate"])
        gatekeeper = Bool(runProcess(["/usr/sbin/spctl", "--status"]))
    }
}

extension MaintenanceChecks.AutomaticUpdates {
    init() {
        checkMacOSUpdates = Bool(readDefault("/Library/Preferences/com.apple.SoftwareUpdate", "AutomaticCheckEnabled"))
        downloadMacOSUpdates = Bool(readDefault("/Library/Preferences/com.apple.SoftwareUpdate", "AutomaticDownload"))
        installMacOSUpdates = Bool(readDefault("/Library/Preferences/com.apple.SoftwareUpdate", "AutomaticallyInstallMacOSUpdates"))
        installCriticalUpdates = Bool(readDefault("/Library/Preferences/com.apple.SoftwareUpdate", "CriticalUpdateInstall"))
        installConfigData = Bool(readDefault("/Library/Preferences/com.apple.SoftwareUpdate", "ConfigDataInstall"))
        installAppStoreUpdates = Bool(readDefault("/Library/Preferences/com.apple.commerce", "AutoUpdate"))
    }
}
