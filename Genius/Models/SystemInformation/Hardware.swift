//
// Hardware.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import IOKit

extension SystemInformation {

	// swiftformat:disable organizeDeclarations
	enum Hardware {

		enum Model {

			static let name = SystemInformationData<String?>(IORegistry.read(name: "product", "product-name"))
			static let localizedName = SystemInformationData<String?>({
				guard let serialNumber = Machine.serialNumber.value, [11, 12].contains(serialNumber.count) else { return nil }
				// swiftlint:disable:next explicit_type_interface
				let url = """
				https://support-sp.apple.com/sp/product?\
				cc=\(serialNumber.dropFirst(8))&\
				lang=\(Locale.currentLanguageCode ?? "")
				"""
				return String(Network.transferURL(url)?.between(start: "<configCode>", end: "</configCode>"))
			}() ?? name.value)
			static let identifier = SystemInformationData<String?>(Sysctl.read("hw.product"))
			static let number = SystemInformationData<String?>(
				{
					guard
						let modelNumber = IORegistry<String>.read(class: "IOPlatformExpertDevice", "model-number"),
						let regionInfo = IORegistry<String>.read(class: "IOPlatformExpertDevice", "region-info")
					else { return nil }
					return modelNumber + regionInfo
				},
				applicable: CPU.type.value == .appleSilicon
			)
			// swiftlint:disable:next unused_declaration
			static let isLaptop = SystemInformationData<Bool?>(name.value?.hasPrefix("MacBook"))
			static let isVirtualMachine = SystemInformationData<Bool>(Sysctl.read("kern.hv_vmm_present") ?? false)
			static let systemImage = SystemInformationData<String>(systemImageFallback({
				if isVirtualMachine.value {
					"macwindow"
				} else if name.value.hasPrefix("MacBook") {
					switch identifier.value {
					case "Mac14,7": "macbook.gen1"
					case _ where identifier.value.hasPrefix("MacBookPro18"): "macbook.gen2"
					case _ where identifier.value.hasPrefix("MacBook"): "macbook.gen1"
					default: "macbook.gen2"
					}
				} else if name.value.hasPrefix("iMac") {
					"desktopcomputer"
				} else if name.value.hasPrefix("Mac mini") {
					"macmini"
				} else if name.value.hasPrefix("Mac Studio") {
					"macstudio"
				} else if name.value.hasPrefix("Mac Pro") {
					switch identifier.value {
					case "MacPro3,1", "MacPro4,1", "MacPro5,1": "macpro.gen1"
					case "MacPro6,1": "macpro.gen2"
					default: "macpro.gen3"
					}
				} else if name.value.hasPrefix("Xserve") {
					"xserve"
				} else { "desktopcomputer.and.macbook" }
			}()))
		}

		enum CPU {

			enum Cores {

				static let differentTypes = SystemInformationData<Bool>(type.value == .appleSilicon && !Model.isVirtualMachine.value)
				static let total = SystemInformationData<Int?>(Sysctl.read("hw.physicalcpu"))
				static let performance =
					SystemInformationData<Int?>({ Sysctl.read("hw.perflevel0.physicalcpu") }, applicable: differentTypes.value)
				static let efficiency =
					SystemInformationData<Int?>({ Sysctl.read("hw.perflevel1.physicalcpu") }, applicable: differentTypes.value)
			}

			static let type = SystemInformationData<CPUType?>({
				switch Sysctl<String>.read("hw.machine") {
				case "arm64": .appleSilicon
				case "x86_64": .intel
				default: nil
				}
			}())
			static let name = SystemInformationData<String?>(Sysctl.read("machdep.cpu.brand_string"))
			static let speed = SystemInformationData<Frequency?>(
				{ Double(Sysctl.read("hw.cpufrequency")).map(Frequency.init) },
				applicable: type.value == .intel
			)
		}

		static let memory = SystemInformationData<InformationStorage?>(Double(Sysctl.read("hw.memsize")).map(InformationStorage.init))

		enum Machine {

			static let serialNumber =
				SystemInformationData<String?>(IORegistry.read(class: "IOPlatformExpertDevice", kIOPlatformSerialNumberKey))
			static let hardwareUUID =
				SystemInformationData<String?>(IORegistry.read(class: "IOPlatformExpertDevice", kIOPlatformUUIDKey))
			static let provisioningUDID = SystemInformationData<String?>(SystemProfiler.hardware?["provisioning_UDID"])
		}
	}
}
