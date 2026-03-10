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
				{ await Bool(firmwarepasswdOutput: Process("/usr/sbin/firmwarepasswd", "-check")?.runSafe(asRoot: true)) },
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
					switch IORegistry(class: "AppleCredentialManager").read("TRM_ConfigProfile") as Int? {
						case 1: .alwaysAsk
						case 2: .askForNewAccessories
						case 3: .automaticallyAllowWhenUnlocked
						case 4: .alwaysAllow
						default: nil
					}
				}(),
				available: {
					#if arch(arm64)
						Hardware.Model.isLaptop &&?
							{ if #available(macOS 26, *) { true } else { Software.OS.bootMode.value !=? .recovery } }()
					#elseif arch(x86_64)
						false
					#endif
				}(),
			)
		}

		enum AutomaticUpdates {

			static let checkMacOS = MaintenanceCheck<Bool?, _>(
				defaultsDomain: "/Library/Preferences/com.apple.SoftwareUpdate",
				key: "AutomaticCheckEnabled",
				default: true,
				available: { if #available(macOS 15, *) { false } else { true } }(),
			)
			static let downloadMacOS = MaintenanceCheck<Bool?, _>(
				defaultsDomain: "/Library/Preferences/com.apple.SoftwareUpdate",
				key: "AutomaticDownload",
				default: true,
			)
			static let installMacOS = MaintenanceCheck<Bool?, _>(
				defaultsDomain: "/Library/Preferences/com.apple.SoftwareUpdate",
				key: "AutomaticallyInstallMacOSUpdates",
				default: false,
			)
			static let installCritical = MaintenanceCheck<Bool?, _>(
				defaultsDomain: "/Library/Preferences/com.apple.SoftwareUpdate",
				key: "CriticalUpdateInstall",
				default: true,
			)
			static let installConfigurationData = MaintenanceCheck<Bool?, _>(
				defaultsDomain: "/Library/Preferences/com.apple.SoftwareUpdate",
				key: "ConfigDataInstall",
				default: true,
			)
			static let backgroundSecurityImprovements = MaintenanceCheck<Bool?, _>(
				defaultsDomain: "/Library/Preferences/com.apple.SoftwareUpdate",
				key: "SplatEnabled",
				default: true,
				available: { if #available(macOS 26.1, *) { true } else { false } }(),
			)
			static let installAppStoreApps = MaintenanceCheck<Bool?, _>(
				defaultsDomain: "/Library/Preferences/com.apple.commerce",
				key: "AutoUpdate",
				default: false,
			)
		}
	}
}
