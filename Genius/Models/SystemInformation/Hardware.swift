//
// Hardware.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

extension SystemInformation {

	// swiftformat:disable organizeDeclarations
	enum Hardware {

		enum Model {

			static let line = SystemInformationData<String?>(SystemProfiler.hardware?["machine_name"])
			static let identifier = SystemInformationData<String?>(SystemProfiler.hardware?["machine_model"])
			static let number = SystemInformationData<String?>(SystemProfiler.hardware?["model_number"])
			// swiftlint:disable:next unused_declaration
			static let isLaptop = SystemInformationData<Bool?>(line.value?.hasPrefix("MacBook"))
			static let systemImage = SystemInformationData<String>(systemImageFallback({
				switch line.value {
				case _ where line.value.hasPrefix("MacBook"):
					switch identifier.value {
					case "Mac14,7": "macbook.gen1"
					case _ where identifier.value.hasPrefix("MacBookPro18"): "macbook.gen2"
					case _ where identifier.value.hasPrefix("MacBook"): "macbook.gen1"
					default: "macbook.gen2"
					}
				case "iMac", "iMac Pro": "desktopcomputer"
				case "Mac mini": "macmini"
				case "Mac Studio": "macstudio"
				case "Mac Pro":
					switch identifier.value {
					case "MacPro3,1", "MacPro4,1", "MacPro5,1": "macpro.gen1"
					case "MacPro6,1": "macpro.gen2"
					default: "macpro.gen3"
					}
				case "Xserve": "xserve"
				case _ where line.value.hasPrefix("Apple Virtual Machine"): "macwindow"
				default: "desktopcomputer.and.macbook"
				}
			}()))
			static let name = SystemInformationData<String?>({
				guard let serialNumber = Machine.serialNumber.value, [11, 12].contains(serialNumber.count) else { return nil }
				// swiftlint:disable:next explicit_type_interface
				let url = """
				https://support-sp.apple.com/sp/product?\
				cc=\(serialNumber.dropFirst(8))&\
				lang=\(Locale.currentLanguageCode ?? "")
				"""
				return Network.transferURL(url)?.between(start: "<configCode>", end: "</configCode>")
			}())
		}

		enum CPU {

			enum Cores {

				static let cores: (Int?, Int?, Int?)? =
					switch type.value {
					case .appleSilicon:
						[Int](
							(SystemProfiler.hardware?["number_processors"] as? String)?
								.remove("proc ").split(separator: ":")
						).map { ($0[safe: 0], $0[safe: 1], $0[safe: 2]) }
					case .intel: (SystemProfiler.hardware?["number_processors"] as? Int, nil, nil)
					default: nil
					}
				static let total = SystemInformationData<Int?>(cores?.0)
				static let performance = SystemInformationData<Int?>(cores?.1)
				static let efficiency = SystemInformationData<Int?>(cores?.2)
			}

			static let type = SystemInformationData<CPUType?>({
				if SystemProfiler.hardware.contains(key: "chip_type") {
					.appleSilicon
				} else if SystemProfiler.hardware.contains(key: "cpu_type") {
					.intel
				} else { nil }
			}())
			static let name =
				SystemInformationData<String?>(SystemProfiler.hardware?["chip_type"] ?? SystemProfiler.hardware?["cpu_type"])
			static let speed = SystemInformationData<Frequency?>(Frequency(SystemProfiler.hardware?["current_processor_speed"]))
		}

		static let memory =
			SystemInformationData<InformationStorage?>(InformationStorage(SystemProfiler.hardware?["physical_memory"]))

		enum Machine {

			static let serialNumber = SystemInformationData<String?>(SystemProfiler.hardware?["serial_number"])
			static let hardwareUUID = SystemInformationData<String?>(SystemProfiler.hardware?["platform_UUID"])
			static let provisioningUDID = SystemInformationData<String?>(SystemProfiler.hardware?["provisioning_UDID"])
		}
	}
}
