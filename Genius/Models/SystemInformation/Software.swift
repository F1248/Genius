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

			static let components = (SystemProfiler.software?["kernel_version"] as? String)?.split(separator: " ").map(String.init)
			static let name = SystemInformationData<String?>(components?[safe: 0])
			static let version = SystemInformationData<VersionNumber?>(VersionNumber(components?[safe: 1]))
		}

		enum OS {

			static let components = (SystemProfiler.software?["os_version"] as? String)?.split(separator: " ").map(String.init)
			static let name = SystemInformationData<String?>(components?[safe: 0])
			static let version = SystemInformationData<VersionNumber?>(VersionNumber(components?[safe: 1]))
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
			static let build = SystemInformationData<String?>(components?.last?.trimmingCharacters(in: .parentheses))
			static let bootMode = SystemInformationData<BootMode?>({
				if !FileManager.default.fileExists(atPath: "/System/Library/CoreServices/Finder.app") {
					.recovery
				} else {
					switch SystemProfiler.software?["boot_mode"] as? String {
					case "normal_boot": .normal
					case "safe_boot": .safe
					default: nil
					}
				} // swiftformat:disable:next blankLinesBetweenScopes
			}())
			static let bootVolume = SystemInformationData<String?>(SystemProfiler.software?["boot_volume"])
			static let loaderVersion = SystemInformationData<String?>(SystemProfiler.hardware?["os_loader_version"])
		}

		enum Computer {

			static let name = SystemInformationData<String?>(SystemProfiler.software?["local_host_name"])
		}

		enum User {

			static let components = (SystemProfiler.software?["user_name"] as? String)?.split(separator: " ")
			static let name = SystemInformationData<String?>(components?.dropLast().joined(separator: " "))
			static let accountName = SystemInformationData<String?>(components?.last?.trimmingCharacters(in: .parentheses))
		}
	}
}
