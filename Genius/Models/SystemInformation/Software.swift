//
// Software.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension SystemInformation {

	// swiftformat:disable organizeDeclarations
	enum Software {

		enum SMC {

			static let version = SystemInformationData<String?>(
				{ SystemProfiler.hardware?["SMC_version_system"] },
				applicable: SystemProfiler.hardware.contains(key: "SMC_version_system")
			)
		}

		enum Firmware {

			static let version = SystemInformationData<String?>(SystemProfiler.hardware?["boot_rom_version"])
		}

		enum Kernel {

			static let name = SystemInformationData<String?>(Sysctl.value(for: "kern.ostype"))
			static let version = SystemInformationData<VersionNumber?>(VersionNumber(Sysctl.value(for: "kern.osrelease")))
		}

		enum OS {

			static let version = SystemInformationData<VersionNumber?>(VersionNumber(Sysctl.value(for: "kern.osproductversion")))
			static let codeName = SystemInformationData<String?>({
				switch version.value?.major {
				case 11: "Big Sur"
				case 12: "Monterey"
				case 13: "Ventura"
				case 14: "Sonoma"
				case 15: "Sequoia"
				default: nil
				}
			}())
			static let build = SystemInformationData<String?>(Sysctl.value(for: "kern.osversion"))
			static let bootMode = SystemInformationData<BootMode?>({
				if Sysctl.value(for: "hw.osenvironment") == "recoveryos" {
					.recovery
				} else if let safe: Bool = Sysctl.value(for: "kern.safeboot") {
					safe ? .safe : .normal
				} else { nil }
			}())
			static let bootVolume = SystemInformationData<String?>(SystemProfiler.software?["boot_volume"])
			static let loaderVersion = SystemInformationData<String?>(SystemProfiler.hardware?["os_loader_version"])
		}

		enum Computer {

			static let name = SystemInformationData<String?>(SystemProfiler.software?["local_host_name"] ?? Host.current().localizedName)
			static let hostName = SystemInformationData<String?>(Sysctl.value(for: "kern.hostname"))
		}

		enum User {

			static let name = SystemInformationData<String>(NSFullUserName())
			static let accountName = SystemInformationData<String>(NSUserName())
		}
	}
}
