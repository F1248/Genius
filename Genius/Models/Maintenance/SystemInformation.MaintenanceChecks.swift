//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension SystemInformation {

	enum MaintenanceChecks {

		enum TheftProtection {

			static let activationLock = MaintenanceCheck<Bool?, _>(
				{ await Bool(systemProfilerActivationLockStatusOutput: SystemProfiler.hardware?["activation_lock_status"]) },
				available: Hardware.securityChip.value >=? .t2 &&?
					!?Hardware.Model.isVirtualMachine &&?
					Software.OS.bootMode.value !=? .recovery,
			)
			static let firmwarePassword = MaintenanceCheck<Bool?, _>(
				{ await Bool(firmwarepasswdOutput: Process("/usr/sbin/firmwarepasswd", "-check", asRoot: true)?.runSafe()) },
				available: {
					#if arch(arm64)
						false
					#elseif arch(x86_64)
						!?Hardware.Model.isVirtualMachine
					#endif
				}(),
			)
		}

		enum DataSecurity {

			static let fileVault = MaintenanceCheck<Bool?, _>(
				{ await Bool(fdesetupOutput: Process("/usr/bin/fdesetup", "status")?.runSafe()) },
				available: Software.OS.bootMode.value !=? .recovery,
			)
		}

		enum MalwareProtection {

			static let systemIntegrityProtection = MaintenanceCheck<Bool?, _>(
				{ await Bool(csrutilOutput: Process("/usr/bin/csrutil", "status")?.runSafe()) },
				available: Software.OS.bootMode.value !=? .recovery,
			)
			static let firewall = MaintenanceCheck<Bool?, _>(
				{
					await Bool(
						socketfilterfwOutput: Process("/usr/libexec/ApplicationFirewall/socketfilterfw", "--getglobalstate")?
							.runSafe(),
					)
				},
				available: Software.OS.bootMode.value !=? .recovery,
			)
			static let gatekeeper = MaintenanceCheck<Bool?, _>(
				{ await Bool(spctlOutput: Process("/usr/sbin/spctl", "--status")?.runSafe()) },
				available: Software.OS.bootMode.value !=? .recovery,
			)
			static let allowAccessoriesToConnect = MaintenanceCheck<AllowAccessoriesToConnectSetting?, _>(
				{
					switch IORegistry(class: "AppleCredentialManager").read("TRM_EffectiveConfigProfile") as Int? {
						case 1: .alwaysAsk
						case 2: .askForNewAccessories
						case 3: .automaticallyAllowWhenUnlocked
						case 4: .alwaysAllow
						default: nil
					}
				}(),
				available: {
					#if arch(arm64)
						Hardware.Model.isLaptop &&? Software.OS.bootMode.value !=? .recovery
					#elseif arch(x86_64)
						false
					#endif
				}(),
			)
		}

		enum AutomaticUpdates {

			static let checkMacOS = MaintenanceCheck<Bool?, _>(
				UserDefaults(suiteName: "/Library/Preferences/com.apple.SoftwareUpdate")?
					.read(key: "AutomaticCheckEnabled", default: true),
				available: { if #available(macOS 15, *) { false } else { Software.OS.bootMode.value !=? .recovery } }(),
			)
			static let downloadMacOS = MaintenanceCheck<Bool?, _>(
				UserDefaults(suiteName: "/Library/Preferences/com.apple.SoftwareUpdate")?
					.read(key: "AutomaticDownload", default: true),
				available: Software.OS.bootMode.value !=? .recovery,
			)
			static let installMacOS = MaintenanceCheck<Bool?, _>(
				UserDefaults(suiteName: "/Library/Preferences/com.apple.SoftwareUpdate")?
					.read(key: "AutomaticallyInstallMacOSUpdates", default: false),
				available: Software.OS.bootMode.value !=? .recovery,
			)
			static let installCritical = MaintenanceCheck<Bool?, _>(
				UserDefaults(suiteName: "/Library/Preferences/com.apple.SoftwareUpdate")?
					.read(key: "CriticalUpdateInstall", default: true),
				available: Software.OS.bootMode.value !=? .recovery,
			)
			static let installConfigurationData = MaintenanceCheck<Bool?, _>(
				UserDefaults(suiteName: "/Library/Preferences/com.apple.SoftwareUpdate")?
					.read(key: "ConfigDataInstall", default: true),
				available: Software.OS.bootMode.value !=? .recovery,
			)
			static let backgroundSecurityImprovements = MaintenanceCheck<Bool?, _>(
				UserDefaults(suiteName: "/Library/Preferences/com.apple.SoftwareUpdate")?
					.read(key: "SplatEnabled", default: true),
				available: { if #available(macOS 26.1, *) { Software.OS.bootMode.value !=? .recovery } else { false } }(),
			)
			static let installAppStoreApps = MaintenanceCheck<Bool?, _>(
				UserDefaults(suiteName: "/Library/Preferences/com.apple.commerce")?
					.read(key: "AutoUpdate", default: false),
				available: Software.OS.bootMode.value !=? .recovery,
			)
		}
	}
}
