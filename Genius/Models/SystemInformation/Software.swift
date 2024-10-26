//
// Software.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension SystemInformation {

	enum Software {

		enum SMC {

			static let version: String? = SystemProfiler.hardware?["SMC_version_system"] as? String
		}

		enum Firmware {

			static let version: VersionNumber? = VersionNumber(SystemProfiler.hardware?["boot_rom_version"])
		}

		enum Kernel {

			static let components = (SystemProfiler.software?["kernel_version"] as? String)?.split(separator: " ")
			static let name: String? = String(components?[safe: 0])
			static let version: VersionNumber? = VersionNumber(components?[safe: 1])
		}

		enum OS {

			// swiftformat:disable organizeDeclarations
			static let components = (SystemProfiler.software?["os_version"] as? String)?.split(separator: " ")
			static let name: String? = String(components?[safe: 0])
			static let version: VersionNumber? = VersionNumber(components?[safe: 1])
			static let codeName: String? =
				switch version?.major {
				case 13: "Ventura"
				case 14: "Sonoma"
				case 15: "Sequoia"
				default: nil
				}
			static let build: String? = components?.last?.trimmingCharacters(in: .parentheses)
			static let bootMode: BootMode? =
				if !FileManager.default.fileExists(atPath: "/System/Library/CoreServices/Finder.app") {
					.recovery
				} else {
					switch SystemProfiler.software?["boot_mode"] as? String {
					case "normal_boot": .normal
					case "safe_boot": .safe
					default: nil
					}
				} // swiftformat:disable:next blankLinesBetweenScopes
			static let bootVolume: String? = SystemProfiler.software?["boot_volume"] as? String
			static let loaderVersion: VersionNumber? = VersionNumber(SystemProfiler.hardware?["os_loader_version"])
			// swiftformat:enable organizeDeclarations
		}

		enum Computer {

			static let name: String? = SystemProfiler.software?["local_host_name"] as? String
		}

		enum User {

			static let components = (SystemProfiler.software?["user_name"] as? String)?.split(separator: " ")
			static let name: String? = components?.dropLast().joined(separator: " ")
			static let accountName: String? = components?.last?.trimmingCharacters(in: .parentheses)
		}
	}
}
