//
//  MaintenanceChecks.swift
//  OpenMacHelper
//
//  Created by F1248.
//

extension SystemInformation {

    enum MaintenanceChecks {

        enum TheftProtection {

            static let activationLock: Bool? = Bool(SystemProfiler.hardware?["activation_lock_status"])
            static let firmwarePassword: Bool? =
                Hardware.Model.isIntel ? Bool(runProcess(["/usr/sbin/firmwarepasswd", "-check"], asRoot: true)) : nil
        }

        enum DataSecurity {

            static let fileVault: Bool? = Bool(runProcess(["/usr/bin/fdesetup", "isactive"]))
        }

        enum MalwareProtection {

            static let hyperThreading: Bool? = Bool(SystemProfiler.hardware?["platform_cpu_htt"])
            static let secureVirtualMemory: Bool? = Bool(SystemProfiler.software?["secure_vm"])
            static let systemIntegrityProtection: Bool? = Bool(SystemProfiler.software?["system_integrity"])
            static let firewall: Bool? = Bool(SystemProfiler.firewall?["spfirewall_globalstate"])
            static let gatekeeper: Bool? = Bool(runProcess(["/usr/sbin/spctl", "--status"]))
        }

        enum AutomaticUpdates {

            static let checkMacOS: Bool? =
                Bool(Defaults.read("/Library/Preferences/com.apple.SoftwareUpdate", "AutomaticCheckEnabled"))
            static let downloadMacOS: Bool? =
                Bool(Defaults.read("/Library/Preferences/com.apple.SoftwareUpdate", "AutomaticDownload"))
            static let installMacOS: Bool? =
                Bool(Defaults.read("/Library/Preferences/com.apple.SoftwareUpdate", "AutomaticallyInstallMacOSUpdates"))
            static let installCritical: Bool? =
                Bool(Defaults.read("/Library/Preferences/com.apple.SoftwareUpdate", "CriticalUpdateInstall"))
            static let installConfigData: Bool? =
                Bool(Defaults.read("/Library/Preferences/com.apple.SoftwareUpdate", "ConfigDataInstall"))
            static let installAppStore: Bool? = Bool(Defaults.read("/Library/Preferences/com.apple.commerce", "AutoUpdate"))
        }
    }
}
