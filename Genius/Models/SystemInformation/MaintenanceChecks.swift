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
				IORegistry(class: IORegistryName.nvramVariables).keyExists("fmm-mobileme-token-FMM"),
				applicable: Hardware.securityChip.value >=? .t2 &&? !?Hardware.Model.isVirtualMachine
			)
			static let firmwarePassword = SystemInformationData<Bool?>(
				Bool(firmwarepasswdOutput: Process("/usr/sbin/firmwarepasswd", "-check", requiresRoot: true)?.runSafe()),
				applicable: Hardware.CPU.type.value == .intel &&? !?Hardware.Model.isVirtualMachine
			)
		}

		enum DataSecurity {

			static let fileVault = SystemInformationData<Bool?>(
				Bool(fdesetupOutput: Process("/usr/bin/fdesetup", "status")?.runSafe()),
				applicable: Software.OS.bootMode.value !=? .recovery
			)
		}

		enum MalwareProtection {

			static let systemIntegrityProtection = SystemInformationData<Bool?>(
				Bool(csrutilOutput: Process("/usr/bin/csrutil", "status")?.runSafe()),
				applicable: Software.OS.bootMode.value !=? .recovery
			)
			static let firewall = SystemInformationData<Bool?>(
				Bool(socketfilterfwOutput: Process("/usr/libexec/ApplicationFirewall/socketfilterfw", "--getglobalstate")?.runSafe()),
				applicable: Software.OS.bootMode.value !=? .recovery
			)
			static let gatekeeper = SystemInformationData<Bool?>(Bool(spctlOutput: Process("/usr/sbin/spctl", "--status")?.runSafe()))
		}

		enum AutomaticUpdates {

			static let checkMacOS = SystemInformationData<Bool?>(
				UserDefaults.read("/Library/Preferences/com.apple.SoftwareUpdate", "AutomaticCheckEnabled"),
				applicable: { if #unavailable(macOS 15) { true } else { false } }() &&? UserDefaults.available
			)
			static let downloadMacOS = SystemInformationData<Bool?>(
				UserDefaults.read("/Library/Preferences/com.apple.SoftwareUpdate", "AutomaticDownload"),
				applicable: UserDefaults.available
			)
			static let installMacOS = SystemInformationData<Bool?>(
				UserDefaults.read("/Library/Preferences/com.apple.SoftwareUpdate", "AutomaticallyInstallMacOSUpdates"),
				applicable: UserDefaults.available
			)
			static let installCritical = SystemInformationData<Bool?>(
				UserDefaults.read("/Library/Preferences/com.apple.SoftwareUpdate", "CriticalUpdateInstall"),
				applicable: UserDefaults.available
			)
			static let installConfigurationData = SystemInformationData<Bool?>(
				UserDefaults.read("/Library/Preferences/com.apple.SoftwareUpdate", "ConfigDataInstall"),
				applicable: UserDefaults.available
			)
			static let installAppStoreApps = SystemInformationData<Bool?>(
				UserDefaults.read("/Library/Preferences/com.apple.commerce", "AutoUpdate"),
				applicable: UserDefaults.available
			)
		}
	}
}
