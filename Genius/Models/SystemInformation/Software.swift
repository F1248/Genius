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

			static let version = SystemInformationData<String?, _>(
				SystemProfiler.hardware?["SMC_version_system"] as? String,
				applicable: Hardware.securityChip.value <=? .t1 &&? SystemProfiler.available
			)
		}

		enum Firmware {

			static let version = SystemInformationData<String?, _>(
				SystemProfiler.hardware?["boot_rom_version"] as? String,
				applicable: SystemProfiler.available
			)
		}

		enum Kernel {

			static let name = SystemInformationData<String?, _>(Sysctl.read("kern.ostype"))
			static let version = SystemInformationData<VersionNumber?, _>(VersionNumber(Sysctl.read("kern.osrelease")))
		}

		enum OS {

			static let version = SystemInformationData<VersionNumber?, _>(VersionNumber(Sysctl.read("kern.osproductversion")))
			static let codeName = SystemInformationData<String?, _>({
				if #available(macOS 16, *) {
					nil
				} else if #available(macOS 15, *) {
					"Sequoia"
				} else {
					"Sonoma"
				}
			}())
			static let buildNumber = SystemInformationData<String?, _>(Sysctl.read("kern.osversion"))
			static let bootMode = SystemInformationData<BootMode?, _>({
				if !FileManager.default.fileExists(atPath: "/System/Library/CoreServices/Finder.app") { return .recovery }
				guard let safe: Bool = Sysctl.read("kern.safeboot") else { return nil }
				return safe ? .safe : .normal
			}())
			static let bootVolume =
				SystemInformationData<String?, _>(SystemProfiler.software?["boot_volume"] as? String, applicable: SystemProfiler.available)
			static let loaderVersion = SystemInformationData<String?, _>(
				SystemProfiler.hardware?["os_loader_version"] as? String,
				applicable: SystemProfiler.available
			)
		}

		enum Computer {

			static let name =
				SystemInformationData<String?, _>(SystemProfiler.software?["local_host_name"] as? String ?? Host.current().localizedName)
			static let hostName = SystemInformationData<String?, _>(Sysctl.read("kern.hostname"))
		}

		enum User {

			static let name = SystemInformationData<String, _>(NSFullUserName())
			static let accountName = SystemInformationData<String, _>(NSUserName())
		}
	}
	// swiftformat:enable organizeDeclarations
}
