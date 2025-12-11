//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension SystemInformation {

	enum Software {

		enum SMC {

			static let version = SystemInformationData<String?, _>(
				{ await SystemProfiler.hardware?["SMC_version_system"] as? String },
				available: Hardware.securityChip.value <=? .t1 &&? SystemProfiler.available,
			)
		}

		enum Firmware {

			static let version = SystemInformationData<String?, _>(
				{ await SystemProfiler.hardware?["boot_rom_version"] as? String },
				available: SystemProfiler.available,
			)
		}

		enum Kernel {

			static let name = SystemInformationData<String?, _>(Sysctl.read("kern.ostype"))
			static let version = SystemInformationData<VersionNumber?, _>(
				Sysctl.read("kern.osrelease").flatMap(VersionNumber.init),
			)
		}

		enum OS {

			static let version = SystemInformationData<VersionNumber?, _>(
				Sysctl.read("kern.osproductversion").flatMap(VersionNumber.init),
			)
			static let codeName = SystemInformationData<String?, _>(
				PrivateFramework.aboutSettings.ASPlatformInfo?.shared?.osTitleString ?? {
					if #unavailable(macOS 14) {
						"macOS Ventura"
					} else if #unavailable(macOS 15) {
						"macOS Sonoma"
					} else if #unavailable(macOS 16) {
						"macOS Sequoia"
					} else if #unavailable(macOS 26) {
						nil
					} else if #unavailable(macOS 27) {
						"macOS Tahoe"
					} else { nil }
				}(),
			)
			static let buildNumber = SystemInformationData<String?, _>(Sysctl.read("kern.osversion"))
			static let bootMode = SystemInformationData<BootMode?, _>({
				if FileManager.default.fileExists(atPath: "/System/Library/CoreServices/Finder.app") {
					Sysctl.read("kern.safeboot").map { $0 ? .safe : .normal }
				} else {
					.recovery
				}
			}())
			static let bootVolume = SystemInformationData<String?, _>(
				{ await SystemProfiler.software?["boot_volume"] as? String },
				available: SystemProfiler.available,
			)
			static let loaderVersion = SystemInformationData<String?, _>(
				{ await SystemProfiler.hardware?["os_loader_version"] as? String },
				available: SystemProfiler.available,
			)
		}

		enum Computer {

			static let name = SystemInformationData<String?, _>(Host.current().localizedName)
			static let hostName = SystemInformationData<String?, _>(Sysctl.read("kern.hostname"))
		}

		enum User {

			static let name = SystemInformationData<String, _>(NSFullUserName())
			static let accountName = SystemInformationData<String, _>(NSUserName())
		}
	}
}
