//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import Foundation

extension SystemInformation {

	enum Recommendations {

		enum TheftProtection {

			static let activationLock = Recommendation<Bool?, _>(
				{ await Bool(systemProfilerActivationLockStatusOutput: SystemProfiler.hardware?["activation_lock_status"]) },
				available: Hardware.securityChip.value >=? .t2 &&?
					!?Hardware.Model.isVirtualMachine &&?
					Software.OS.bootMode.value !=? .recovery,
			)
			static let firmwarePassword = Recommendation<Bool?, _>(
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

			static let fileVault = Recommendation<Bool?, _>(
				{ await Bool(fdesetupOutput: Process("/usr/bin/fdesetup", "status")?.runSafe()) },
				available: Software.OS.bootMode.value !=? .recovery,
			)
		}

		enum MalwareProtection {

			static let systemIntegrityProtection = Recommendation<Bool?, _>(
				{ await Bool(csrutilOutput: Process("/usr/bin/csrutil", "status")?.runSafe()) },
				available: Software.OS.bootMode.value !=? .recovery,
			)
			static let firewall = Recommendation<Bool?, _>(
				{
					await Bool(
						socketfilterfwOutput: Process("/usr/libexec/ApplicationFirewall/socketfilterfw", "--getglobalstate")?
							.runSafe(),
					)
				},
				available: Software.OS.bootMode.value !=? .recovery,
			)
			static let gatekeeper = Recommendation<Bool?, _>(
				{ await Bool(spctlOutput: Process("/usr/sbin/spctl", "--status")?.runSafe()) },
				available: Software.OS.bootMode.value !=? .recovery,
			)
			static let allowAccessoriesToConnect = Recommendation<AllowAccessoriesToConnectSetting?, _>(
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

			// safe as `suiteName` is neither the globalDomain nor the app’s bundle identifier:
			// https://developer.apple.com/documentation/foundation/userdefaults/init(suitename:)
			// swiftlint:disable force_unwrapping
			static let checkMacOS = Recommendation<Bool?, _>(
				defaultsKey: Defaults.Key(
					"AutomaticCheckEnabled",
					default: true,
					suite: UserDefaults(suiteName: "/Library/Preferences/com.apple.SoftwareUpdate")!,
				),
				available: { if #available(macOS 15, *) { false } else { true } }(),
			)
			static let downloadMacOS = Recommendation<Bool?, _>(
				defaultsKey: Defaults.Key(
					"AutomaticDownload",
					default: true,
					suite: UserDefaults(suiteName: "/Library/Preferences/com.apple.SoftwareUpdate")!,
				),
			)
			static let installMacOS = Recommendation<Bool?, _>(
				defaultsKey: Defaults.Key(
					"AutomaticallyInstallMacOSUpdates",
					default: false,
					suite: UserDefaults(suiteName: "/Library/Preferences/com.apple.SoftwareUpdate")!,
				),
			)
			static let installCritical = Recommendation<Bool?, _>(
				defaultsKey: Defaults.Key(
					"CriticalUpdateInstall",
					default: true,
					suite: UserDefaults(suiteName: "/Library/Preferences/com.apple.SoftwareUpdate")!,
				),
			)
			static let installConfigurationData = Recommendation<Bool?, _>(
				defaultsKey: Defaults.Key(
					"ConfigDataInstall",
					default: true,
					suite: UserDefaults(suiteName: "/Library/Preferences/com.apple.SoftwareUpdate")!,
				),
			)
			static let backgroundSecurityImprovements = Recommendation<Bool?, _>(
				defaultsKey: Defaults.Key(
					"SplatEnabled",
					default: true,
					suite: UserDefaults(suiteName: "/Library/Preferences/com.apple.SoftwareUpdate")!,
				),
				available: { if #available(macOS 26.1, *) { true } else { false } }(),
			)
			static let installAppStoreApps = Recommendation<Bool?, _>(
				defaultsKey: Defaults.Key(
					"AutoUpdate",
					default: { if #available(macOS 26, *) { true } else { false } }(),
					suite: UserDefaults(suiteName: "/Library/Preferences/com.apple.commerce")!,
				),
			)
			// swiftlint:enable force_unwrapping
		}
	}
}
