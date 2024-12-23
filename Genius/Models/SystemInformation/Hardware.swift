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
			static let localizedName = SystemInformationData<String?>({ () -> String? in
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
						let modelNumber = IORegistry.read(class: "IOPlatformExpertDevice", "model-number") as String?,
						let regionInfo = IORegistry.read(class: "IOPlatformExpertDevice", "region-info") as String?
					else { return nil }
					return modelNumber + regionInfo
				},
				applicable: CPU.type.value == .appleSilicon
			)
			static let regulatoryNumber = SystemInformationData<String?>(
				{ IORegistry.read(class: "IOPlatformExpertDevice", "regulatory-model-number") },
				applicable: CPU.type.value == .appleSilicon &&? !?isVirtualMachine.value
			)
			// periphery:ignore
			// swiftlint:disable:next unused_declaration
			static let isLaptop = SystemInformationData<Bool?>(name.value?.hasPrefix("MacBook"))
			static let isVirtualMachine = SystemInformationData<Bool?>(Sysctl.read("kern.hv_vmm_present"))
			static let systemImage = SystemInformationData<String>(systemImageFallback({
				switch true {
					case isVirtualMachine.value: "macwindow"
					case name.value.hasPrefix("MacBook"):
						switch identifier.value {
							case "Mac14,7": "macbook.gen1"
							case _ where identifier.value.hasPrefix("MacBookPro18"): "macbook.gen2"
							case _ where identifier.value.hasPrefix("MacBook"): "macbook.gen1"
							default: "macbook.gen2"
						}
					case name.value.hasPrefix("iMac"): "desktopcomputer"
					case name.value.hasPrefix("Mac mini"): "macmini"
					case name.value.hasPrefix("Mac Studio"): "macstudio"
					case name.value.hasPrefix("Mac Pro"):
						switch identifier.value {
							case "MacPro3,1", "MacPro4,1", "MacPro5,1": "macpro.gen1"
							case "MacPro6,1": "macpro.gen2"
							default: ["A2304", "A2787"].contains(regulatoryNumber.value) ? "macpro.gen3.server" : "macpro.gen3"
						}
					case name.value.hasPrefix("Xserve"): "xserve"
					default: "desktopcomputer.and.macbook"
				}
			}()))
		}

		static let securityChip = SystemInformationData<SecurityChip>({
			switch CPU.type.value {
				case .appleSilicon: .mSeries
				case .intel:
					if IORegistry.serviceExists(name: "Apple T2 Controller") {
						.t2
					} else if IORegistry.serviceExists(name: "Apple T1 Controller") {
						.t1
					} else {
						.none
					}
			}
		}())

		enum CPU {

			enum Cores {

				static let differentTypes = SystemInformationData<Bool?>(type.value == .appleSilicon &&? !?Model.isVirtualMachine.value)
				static let total = SystemInformationData<Int?>(Sysctl.read("hw.physicalcpu"))
				static let performance =
					SystemInformationData<Int?>({ Sysctl.read("hw.perflevel0.physicalcpu") }, applicable: differentTypes.value)
				static let efficiency =
					SystemInformationData<Int?>({ Sysctl.read("hw.perflevel1.physicalcpu") }, applicable: differentTypes.value)
			}

			static let type = SystemInformationData<CPUType>({
				#if arch(arm64)
					.appleSilicon
				#elseif arch(x86_64)
					.intel
				#else
					#error("Unsupported architecture")
				#endif
			}())
			static let name = SystemInformationData<String?>(Sysctl.read("machdep.cpu.brand_string"))
			static let frequency =
				SystemInformationData<Frequency?>({ Sysctl.read("hw.cpufrequency").map(Frequency.init) }, applicable: type.value == .intel)
		}

		static let memory = SystemInformationData<InformationStorage?>(Sysctl.read("hw.memsize").map(InformationStorage.init))

		enum Machine {

			static let serialNumber =
				SystemInformationData<String?>(IORegistry.read(class: "IOPlatformExpertDevice", kIOPlatformSerialNumberKey))
			static let hardwareUUID =
				SystemInformationData<String?>(IORegistry.read(class: "IOPlatformExpertDevice", kIOPlatformUUIDKey))
			static let provisioningUDID = SystemInformationData<String?>(
				{ SystemProfiler.hardware?["provisioning_UDID"] ?? (CPU.type.value == .intel ? hardwareUUID : nil) },
				applicable: Software.OS.bootMode.value !=? .recovery ||? CPU.type.value == .intel
			)
		}
	}
}
