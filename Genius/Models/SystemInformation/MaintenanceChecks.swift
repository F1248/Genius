//
// MaintenanceChecks.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension SystemInformation {

	enum MaintenanceChecks {

		enum TheftProtection {

			static let activationLock = SystemInformationData<Bool?>(
				{ IORegistry(class: "IODTNVRAM").keyExists("fmm-mobileme-token-FMM") },
				applicable: Hardware.securityChip.value >=? .t2
			)
			static let firmwarePassword = SystemInformationData<Bool?>(
				{ Bool(Process("/usr/sbin/firmwarepasswd", ["-check"], requiresRoot: true)?.runSafe()) },
				applicable: Hardware.CPU.type.value == .intel &&? !?Hardware.Model.isVirtualMachine.value
			)
		}

		enum DataSecurity {

			static let fileVault = SystemInformationData<Bool?>(
				{ Bool(Process("/usr/bin/fdesetup", ["isactive"])?.runSafe()) },
				applicable: Software.OS.bootMode.value !=? .recovery
			)
		}

		enum MalwareProtection {

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

			static let checkMacOS = SystemInformationData<Bool?>(
				{ UserDefaults.read("/Library/Preferences/com.apple.SoftwareUpdate", "AutomaticCheckEnabled") },
				applicable: { if #unavailable(macOS 15) { true } else { false } }() &&? Software.OS.bootMode.value !=? .recovery
			)
			static let downloadMacOS = SystemInformationData<Bool?>(
				{ UserDefaults.read("/Library/Preferences/com.apple.SoftwareUpdate", "AutomaticDownload") },
				applicable: Software.OS.bootMode.value !=? .recovery
			)
			static let installMacOS = SystemInformationData<Bool?>(
				{ UserDefaults.read("/Library/Preferences/com.apple.SoftwareUpdate", "AutomaticallyInstallMacOSUpdates") },
				applicable: Software.OS.bootMode.value !=? .recovery
			)
			static let installCritical = SystemInformationData<Bool?>(
				{ UserDefaults.read("/Library/Preferences/com.apple.SoftwareUpdate", "CriticalUpdateInstall") },
				applicable: Software.OS.bootMode.value !=? .recovery
			)
			static let installConfigurationData = SystemInformationData<Bool?>(
				{ UserDefaults.read("/Library/Preferences/com.apple.SoftwareUpdate", "ConfigDataInstall") },
				applicable: Software.OS.bootMode.value !=? .recovery
			)
			static let installAppStoreApps = SystemInformationData<Bool?>(
				{ UserDefaults.read("/Library/Preferences/com.apple.commerce", "AutoUpdate") },
				applicable: Software.OS.bootMode.value !=? .recovery
			)
		}
	}
}
