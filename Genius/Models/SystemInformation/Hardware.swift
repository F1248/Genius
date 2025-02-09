//
// Hardware.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import IOKit
import SFSafeSymbols

extension SystemInformation {

	// swiftformat:disable organizeDeclarations
	enum Hardware {

		enum Model {

			static let name = SystemInformationData<String?>(IORegistry(name: "product").read("product-name"))
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
			static let identifier = SystemInformationData<String?>(IORegistry(class: "IOPlatformExpertDevice").read("model"))
			static let number = SystemInformationData<String?>(
				{
					guard
						let modelNumber = IORegistry(class: "IOPlatformExpertDevice").read("model-number") as String?,
						let regionInfo = IORegistry(class: "IOPlatformExpertDevice").read("region-info") as String?
					else { return nil }
					return modelNumber + regionInfo
				}(),
				applicable: CPU.type.value == .appleSilicon
			)
			static let regulatoryNumber = SystemInformationData<String?>(
				IORegistry(class: "IOPlatformExpertDevice").read("regulatory-model-number"),
				applicable: CPU.type.value == .appleSilicon &&? !?isVirtualMachine.value
			)
			// periphery:ignore
			// swiftlint:disable:next unused_declaration
			static let isLaptop = SystemInformationData<Bool?>(name.value?.hasPrefix("MacBook"))
			static let isVirtualMachine = SystemInformationData<Bool?>(Sysctl.read("kern.hv_vmm_present"))
			static let sfSymbol = SystemInformationData<SFSymbol>({
				switch true {
					case isVirtualMachine.value: .macwindow
					case name.value.hasPrefix("MacBook"):
						if #available(macOS 14, *) {
							switch identifier.value {
								case "Mac14,7": .macbookGen1
								case _ where identifier.value.hasPrefix("MacBookPro18"): .macbookGen2
								case _ where identifier.value.hasPrefix("MacBook"): .macbookGen1
								default: .macbookGen2
							}
						} else { .laptopcomputer }
					case name.value.hasPrefix("iMac"): .desktopcomputer
					case name.value.hasPrefix("Mac mini"): .macmini
					case name.value.hasPrefix("Mac Studio"): .macstudio
					case name.value.hasPrefix("Mac Pro"):
						switch identifier.value {
							case "MacPro3,1", "MacPro4,1", "MacPro5,1": .macproGen1
							case "MacPro6,1": .macproGen2
							default: ["A2304", "A2787"].contains(regulatoryNumber.value) ? .macproGen3Server : .macproGen3
						}
					case name.value.hasPrefix("Xserve"): .xserve
					default: if #available(macOS 15, *) { .desktopcomputerAndMacbook } else { .desktopcomputer }
				}
			}())
		}

		static let securityChip = SystemInformationData<SecurityChip?>({
			switch CPU.type.value {
				case .appleSilicon: return .mSeries
				case .intel:
					let t2 = IORegistry(name: "Apple T2 Controller").serviceExists()
					if t2 ?? false { return .t2 }
					let t1 = IORegistry(name: "Apple T1 Controller").serviceExists()
					if t1 ?? false { return .t1 }
					if t2 == false, t1 == false { return SecurityChip.none }
					return nil
			}
		}())

		enum CPU {

			enum Cores {

				static let differentTypes = SystemInformationData<Bool?>(type.value == .appleSilicon &&? !?Model.isVirtualMachine.value)
				static let total = SystemInformationData<Int?>(Sysctl.read("hw.physicalcpu"))
				static let performance =
					SystemInformationData<Int?>(Sysctl.read("hw.perflevel0.physicalcpu"), applicable: differentTypes.value)
				static let efficiency =
					SystemInformationData<Int?>(Sysctl.read("hw.perflevel1.physicalcpu"), applicable: differentTypes.value)
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
				SystemInformationData<Frequency?>(Sysctl.read("hw.cpufrequency").map(Frequency.init), applicable: type.value == .intel)
		}

		static let memory = SystemInformationData<InformationStorage?>(Sysctl.read("hw.memsize").map(InformationStorage.init))

		enum Machine {

			static let serialNumber =
				SystemInformationData<String?>(IORegistry(class: "IOPlatformExpertDevice").read(kIOPlatformSerialNumberKey))
			static let hardwareUUID =
				SystemInformationData<String?>(IORegistry(class: "IOPlatformExpertDevice").read(kIOPlatformUUIDKey))
			static let provisioningUDID = SystemInformationData<String?>(
				SystemProfiler.hardware?["provisioning_UDID"] as? String ?? (CPU.type.value == .intel ? hardwareUUID.value : nil),
				applicable: Software.OS.bootMode.value !=? .recovery ||? CPU.type.value == .intel
			)
		}
	}
	// swiftformat:enable organizeDeclarations
}
