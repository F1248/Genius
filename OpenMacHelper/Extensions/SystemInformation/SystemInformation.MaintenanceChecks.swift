//
//  SystemInformation.swift
//  OpenMacHelper
//
//  Created by F1248.
//

extension SystemInformation.MaintenanceChecks.TheftProtection {
    init() {
        activationLock = Bool(SystemProfiler.hardware?["activation_lock_status"])
        firmwarePassword = SystemProfiler.hardware?["chip_type"] != nil ? nil : Bool(runProcess(["/usr/sbin/firmwarepasswd", "-check"], asRoot: true))
    }
}

extension SystemInformation.MaintenanceChecks.DataSecurity {
    init() {
        fileVault = Bool(runProcess(["/usr/bin/fdesetup", "isactive"]))
    }
}

extension SystemInformation.MaintenanceChecks.MalwareProtection {
    init() {
        fullBootSecurity = nil
        hyperThreading = Bool(SystemProfiler.hardware?["platform_cpu_htt"])
        secureVirtualMemory = Bool(SystemProfiler.software?["secure_vm"])
        systemIntegrityProtection = Bool(SystemProfiler.software?["system_integrity"])
        firewall = Bool(SystemProfiler.firewall?["spfirewall_globalstate"])
        gatekeeper = Bool(runProcess(["/usr/sbin/spctl", "--status"]))
    }
}

extension SystemInformation.MaintenanceChecks.AutomaticUpdates {
    init() {
        checkMacOSUpdates = Bool(readDefault("/Library/Preferences/com.apple.SoftwareUpdate", "AutomaticCheckEnabled"))
        downloadMacOSUpdates = Bool(readDefault("/Library/Preferences/com.apple.SoftwareUpdate", "AutomaticDownload"))
        installMacOSUpdates = Bool(readDefault("/Library/Preferences/com.apple.SoftwareUpdate", "AutomaticallyInstallMacOSUpdates"))
        installCriticalUpdates = Bool(readDefault("/Library/Preferences/com.apple.SoftwareUpdate", "CriticalUpdateInstall"))
        installConfigData = Bool(readDefault("/Library/Preferences/com.apple.SoftwareUpdate", "ConfigDataInstall"))
        installAppStoreUpdates = Bool(readDefault("/Library/Preferences/com.apple.commerce", "AutoUpdate"))
    }
}
