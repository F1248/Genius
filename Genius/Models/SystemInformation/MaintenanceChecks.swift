//
//  MaintenanceChecks.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import Foundation

extension SystemInformation {

    enum MaintenanceChecks {

        enum TheftProtection {

            static let activationLock: Bool? = Bool(SystemProfiler.hardware?["activation_lock_status"])
            static let firmwarePassword: Bool? = Hardware.Model.intelBased ?
                Bool(Process("/usr/sbin/firmwarepasswd", ["-check"], requiresRoot: true)?.runSafe()) : nil
        }

        enum DataSecurity {

            static let fileVault: Bool? = Bool(Process("/usr/bin/fdesetup", ["isactive"])?.runSafe())
        }

        enum MalwareProtection {

            static let hyperThreading: Bool? = Bool(SystemProfiler.hardware?["platform_cpu_htt"])
            static let secureVirtualMemory: Bool? = Bool(SystemProfiler.software?["secure_vm"])
            static let systemIntegrityProtection: Bool? = Bool(SystemProfiler.software?["system_integrity"])
            static let firewall: Bool? = Bool(SystemProfiler.firewall?["spfirewall_globalstate"])
            static let gatekeeper: Bool? = Bool(Process("/usr/sbin/spctl", ["--status"])?.runSafe())
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
