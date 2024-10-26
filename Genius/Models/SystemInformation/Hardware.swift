//
// Hardware.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension SystemInformation {

	enum Hardware {

		enum Model {

			static let line: String? = SystemProfiler.hardware?["machine_name"] as? String
			static let identifier: String? = SystemProfiler.hardware?["machine_model"] as? String
			static let number: String? = SystemProfiler.hardware?["model_number"] as? String
			static let isLaptop: Bool? = line?.hasPrefix("MacBook") // swiftlint:disable:this unused_declaration
			static let systemImage: String =
				switch line {
				case _ where line.hasPrefix("MacBook"):
					switch identifier {
					case "Mac14,7": "macbook.gen1"
					case _ where identifier.hasPrefix("MacBookPro18"): "macbook.gen2"
					case _ where identifier.hasPrefix("MacBook"): "macbook.gen1"
					default: "macbook.gen2"
					}
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

				// swiftformat:disable organizeDeclarations
				enum Cores {

					static let total: Int? = cores?.0
					static let performance: Int? = cores?.1
					static let efficiency: Int? = cores?.2
					static let cores: (Int?, Int?, Int?)? =
						switch Hardware.Specifications.CPU.type {
						case .appleSilicon:
							[Int](
								(SystemProfiler.hardware?["number_processors"] as? String)?
									.remove("proc ").split(separator: ":")
							).map { ($0[safe: 0], $0[safe: 1], $0[safe: 2]) }
						case .intel: (SystemProfiler.hardware?["number_processors"] as? Int, nil, nil)
						default: nil
						}
				}

				static let type: CPUType? =
					if SystemProfiler.hardware.contains(key: "chip_type") {
						.appleSilicon
					} else if SystemProfiler.hardware.contains(key: "cpu_type") {
						.intel
					} else { nil }
				static let name: String? =
					SystemProfiler.hardware?["chip_type"] as? String ??
					SystemProfiler.hardware?["cpu_type"] as? String
				static let speed: Measurement<UnitFrequency>? = Measurement(SystemProfiler.hardware?["current_processor_speed"])
				// swiftformat:enable organizeDeclarations
			}

			static let memory: Measurement<UnitInformationStorage>? = Measurement(SystemProfiler.hardware?["physical_memory"])
		}

		enum Machine {

			static let serialNumber: String? = SystemProfiler.hardware?["serial_number"] as? String
			static let hardwareUUID: String? = SystemProfiler.hardware?["platform_UUID"] as? String
			static let provisioningUDID: String? = SystemProfiler.hardware?["provisioning_UDID"] as? String
		}
	}
}
