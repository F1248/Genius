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
				SystemProfiler.hardware?["SMC_version_system"] as? String,
				applicable: Hardware.securityChip.value <=? .t1 &&? OS.bootMode.value !=? .recovery
			)
		}

		enum Firmware {

			static let version = SystemInformationData<String?>(
				SystemProfiler.hardware?["boot_rom_version"] as? String,
				applicable: OS.bootMode.value !=? .recovery
			)
		}

		enum Kernel {

			static let name = SystemInformationData<String?>(Sysctl.read("kern.ostype"))
			static let version = SystemInformationData<VersionNumber?>(VersionNumber(Sysctl.read("kern.osrelease")))
		}

		enum OS {

			static let version = SystemInformationData<VersionNumber?>(VersionNumber(Sysctl.read("kern.osproductversion")))
			static let codeName = SystemInformationData<String?>({
				if #available(macOS 16, *) {
					nil
				} else {
					"Sequoia"
				}
			}())
			static let buildNumber = SystemInformationData<String?>(Sysctl.read("kern.osversion"))
			static let bootMode = SystemInformationData<BootMode?>({
				if Sysctl.read("hw.osenvironment") == "recoveryos" {
					.recovery
				} else if let safe: Bool = Sysctl.read("kern.safeboot") {
					safe ? .safe : .normal
				} else { nil }
			}())
			static let bootVolume =
				SystemInformationData<String?>(SystemProfiler.software?["boot_volume"] as? String, applicable: bootMode.value !=? .recovery)
			static let loaderVersion = SystemInformationData<String?>(
				SystemProfiler.hardware?["os_loader_version"] as? String,
				applicable: bootMode.value !=? .recovery
			)
		}

		enum Computer {

			static let name =
				SystemInformationData<String?>(SystemProfiler.software?["local_host_name"] as? String ?? Host.current().localizedName)
			static let hostName = SystemInformationData<String?>(Sysctl.read("kern.hostname"))
		}

		enum User {

			static let name = SystemInformationData<String>(NSFullUserName())
			static let accountName = SystemInformationData<String>(NSUserName())
		}
	}
	// swiftformat:enable organizeDeclarations
}
