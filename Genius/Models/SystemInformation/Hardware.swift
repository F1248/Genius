//
// Hardware.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension SystemInformation {

	// swiftlint:disable unused_declaration
	enum Hardware {

		enum Model {

			static let line: String? = SystemProfiler.hardware?["machine_name"] as? String
			static let identifier: String? = SystemProfiler.hardware?["machine_model"] as? String
			static let number: String? = SystemProfiler.hardware?["model_number"] as? String
			static let appleSiliconBased: Bool = SystemProfiler.hardware.contains(key: "chip_type")
			static let intelBased: Bool = SystemProfiler.hardware.contains(key: "cpu_type")
			static let isLaptop: Bool = line.hasPrefix("MacBook")
			static let systemImage: String =
				switch line {
				case _ where line.hasPrefix("MacBook"):
					if #available(macOS 14, *) {
						switch identifier {
						case "Mac14,7": "macbook.gen1"
						case _ where identifier.hasPrefix("MacBookPro18"): "macbook.gen2"
						case _ where identifier.hasPrefix("MacBook"): "macbook.gen1"
						default: "macbook.gen2"
						}
					} else { "laptopcomputer" }
				case "iMac", "iMac Pro": "desktopcomputer"
				case "Mac mini": "macmini"
				case "Mac Studio": "macstudio"
				case "Mac Pro":
					switch identifier {
					case "MacPro3,1", "MacPro4,1", "MacPro5,1": "macpro.gen1"
					case "MacPro6,1": "macpro.gen2"
					default: "macpro.gen3"
					}
				case "Xserve": "xserve"
				case _ where line.hasPrefix("Apple Virtual Machine"): "macwindow"
				default: if #available(macOS 15, *) { "desktopcomputer.and.macbook" } else { "desktopcomputer" }
				}
			static let name: String? = {
				guard let serialNumber = Machine.serialNumber, [11, 12].contains(serialNumber.count) else { return nil }
				// swiftlint:disable:next explicit_type_interface
				let url = """
				https://support-sp.apple.com/sp/product?\
				cc=\(serialNumber.dropFirst(8))&\
				lang=\(Locale.currentLanguageCode ?? "")
				"""
				return Network.transferURL(url)?.between(start: "<configCode>", end: "</configCode>")
			}()
		}

		enum Specifications {

			enum CPU {

				enum Cores {

					static let total: Int? = cores?.0
					static let performance: Int? = cores?.1
					static let efficiency: Int? = cores?.2

					static let cores: (Int?, Int?, Int?)? =
						if Model.appleSiliconBased { {
							let components = [Int](
								(SystemProfiler.hardware?["number_processors"] as? String)?
									.remove("proc ").split(separator: ":")
							)
							return (components?[safe: 0], components?[safe: 1], components?[safe: 2])
						}() } else if Model.intelBased {
							(SystemProfiler.hardware?["number_processors"] as? Int, nil, nil)
						} else { nil }
				}

				static let name: String? =
					SystemProfiler.hardware?["chip_type"] as? String ??
					SystemProfiler.hardware?["cpu_type"] as? String
				static let speed: Measurement<UnitFrequency>? = Measurement(SystemProfiler.hardware?["current_processor_speed"])
			}

			static let memory: Measurement<UnitInformationStorage>? = Measurement(SystemProfiler.hardware?["physical_memory"])
		}

		enum Machine {

			static let serialNumber: String? = SystemProfiler.hardware?["serial_number"] as? String
			static let hardwareUUID: String? = SystemProfiler.hardware?["platform_UUID"] as? String
			static let provisioningUDID: String? = SystemProfiler.hardware?["provisioning_UDID"] as? String
		}
	}
	// swiftlint:enable unused_declaration
}
