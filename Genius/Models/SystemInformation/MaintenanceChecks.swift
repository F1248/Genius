//
// MaintenanceChecks.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension SystemInformation {

	// periphery:ignore
	// swiftlint:disable unused_declaration
	enum MaintenanceChecks {

		enum TheftProtection {

			static let activationLock = SystemInformationData<Bool?>(
				{ Bool(SystemProfiler.hardware?["activation_lock_status"]) },
				applicable: Hardware.securityChip.value >=? .t2 &&? Software.OS.bootMode.value !=? .recovery
			)
			static let firmwarePassword = SystemInformationData<Bool?>(
				{ Bool(Process("/usr/sbin/firmwarepasswd", ["-check"], requiresRoot: true)?.runSafe()) },
				applicable: Hardware.CPU.type.value ==? .intel
			)
		}

		enum DataSecurity {

			static let fileVault = SystemInformationData<Bool?>(Bool(Process("/usr/bin/fdesetup", ["isactive"])?.runSafe()))
		}

		enum MalwareProtection {

			static let secureVirtualMemory = SystemInformationData<Bool?>(
				{ Bool(SystemProfiler.software?["secure_vm"]) },
				applicable: Software.OS.bootMode.value !=? .recovery
			)
			static let systemIntegrityProtection = SystemInformationData<Bool?>(
				{ Bool(SystemProfiler.software?["system_integrity"]) },
				applicable: Software.OS.bootMode.value !=? .recovery
			)
			static let firewall = SystemInformationData<Bool?>(
				{ Bool(SystemProfiler.firewall?["spfirewall_globalstate"]) },
				applicable: Software.OS.bootMode.value !=? .recovery
			)
			static let gatekeeper = SystemInformationData<Bool?>(Bool(Process("/usr/sbin/spctl", ["--status"])?.runSafe()))
		}

		enum AutomaticUpdates {

			static let downloadMacOS =
				SystemInformationData<Bool?>(UserDefaults.read("/Library/Preferences/com.apple.SoftwareUpdate", "AutomaticDownload"))
			static let installMacOS = SystemInformationData<Bool?>(
				UserDefaults.read("/Library/Preferences/com.apple.SoftwareUpdate", "AutomaticallyInstallMacOSUpdates")
			)
			static let installCritical =
				SystemInformationData<Bool?>(UserDefaults.read("/Library/Preferences/com.apple.SoftwareUpdate", "CriticalUpdateInstall"))
			static let installConfigData =
				SystemInformationData<Bool?>(UserDefaults.read("/Library/Preferences/com.apple.SoftwareUpdate", "ConfigDataInstall"))
			static let installAppStore =
				SystemInformationData<Bool?>(UserDefaults.read("/Library/Preferences/com.apple.commerce", "AutoUpdate"))
		}
	}
	// swiftlint:enable unused_declaration
}
