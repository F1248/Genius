//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension SystemInformation {

	enum MaintenanceChecks {

		enum TheftProtection {

			static let activationLock = SystemInformationData<Bool?, _>(
				IORegistry(class: IORegistryName.nvramVariables).contains("fmm-mobileme-token-FMM"),
				applicable: Hardware.securityChip.value >=? .t2 &&? !?Hardware.Model.isVirtualMachine,
			)
			static let firmwarePassword = SystemInformationData<Bool?, _>(
				{ await Bool(
					firmwarepasswdOutput: Process("/usr/sbin/firmwarepasswd", "-check", requiresRoot: true)?.runSafe(),
				) },
				applicable: Hardware.CPU.type.value == .intel &&? !?Hardware.Model.isVirtualMachine,
			)
		}

		enum DataSecurity {

			static let fileVault = SystemInformationData<Bool?, _>(
				{ await Bool(fdesetupOutput: Process("/usr/bin/fdesetup", "status")?.runSafe()) },
				applicable: Software.OS.bootMode.value !=? .recovery,
			)
		}

		enum MalwareProtection {

			static let systemIntegrityProtection = SystemInformationData<Bool?, _>(
				{ await Bool(csrutilOutput: Process("/usr/bin/csrutil", "status")?.runSafe()) },
				applicable: Software.OS.bootMode.value !=? .recovery,
			)
			static let firewall = SystemInformationData<Bool?, _>(
				{ await Bool(
					socketfilterfwOutput: Process("/usr/libexec/ApplicationFirewall/socketfilterfw", "--getglobalstate")?
						.runSafe(),
				) },
				applicable: Software.OS.bootMode.value !=? .recovery,
			)
			static let gatekeeper = SystemInformationData<Bool?, _>(
				{ await Bool(spctlOutput: Process("/usr/sbin/spctl", "--status")?.runSafe()) },
				applicable: Software.OS.bootMode.value !=? .recovery,
			)
			static let askToAllowAccessoriesToConnect = SystemInformationData<Bool?, _>(
				{ IORegistry(class: "AppleCredentialManager").read("TRM_EffectiveConfigProfile") ==? 1 },
				applicable: { if #available(macOS 13, *) { true } else { false } }() &&?
					Hardware.CPU.type.value == .appleSilicon &&?
					Hardware.Model.isLaptop &&?
					Software.OS.bootMode.value !=? .recovery,
			)
		}

		enum AutomaticUpdates {

			static let checkMacOS = SystemInformationData<Bool?, _>(
				UserDefaults(suiteName: "/Library/Preferences/com.apple.SoftwareUpdate")?
					.read(key: "AutomaticCheckEnabled", default: true),
				applicable: { if #unavailable(macOS 15) { true } else { false } }() &&?
					Software.OS.bootMode.value !=? .recovery,
			)
			static let downloadMacOS = SystemInformationData<Bool?, _>(
				UserDefaults(suiteName: "/Library/Preferences/com.apple.SoftwareUpdate")?
					.read(key: "AutomaticDownload", default: true),
				applicable: Software.OS.bootMode.value !=? .recovery,
			)
			static let installMacOS = SystemInformationData<Bool?, _>(
				UserDefaults(suiteName: "/Library/Preferences/com.apple.SoftwareUpdate")?
					.read(key: "AutomaticallyInstallMacOSUpdates", default: false),
				applicable: Software.OS.bootMode.value !=? .recovery,
			)
			static let installCritical = SystemInformationData<Bool?, _>(
				UserDefaults(suiteName: "/Library/Preferences/com.apple.SoftwareUpdate")?
					.read(key: "CriticalUpdateInstall", default: true),
				applicable: Software.OS.bootMode.value !=? .recovery,
			)
			static let installConfigurationData = SystemInformationData<Bool?, _>(
				UserDefaults(suiteName: "/Library/Preferences/com.apple.SoftwareUpdate")?
					.read(key: "ConfigDataInstall", default: true),
				applicable: Software.OS.bootMode.value !=? .recovery,
			)
			static let installAppStoreApps = SystemInformationData<Bool?, _>(
				UserDefaults(suiteName: "/Library/Preferences/com.apple.commerce")?
					.read(key: "AutoUpdate", default: false),
				applicable: Software.OS.bootMode.value !=? .recovery,
			)
		}
	}
}
