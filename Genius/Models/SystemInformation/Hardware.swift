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

			static let isVirtualMachine: Bool? = Sysctl.read("kern.hv_vmm_present")
			static let isLaptop: Bool? = namePrefix?.hasPrefix("MacBook")
			static let name = SystemInformationData<String?, _>(
				IORegistry(name: "product").read("product-name"),
				applicable: CPU.type.value == .appleSilicon,
			)
			static let localizedName = SystemInformationData<String?, _>(
				{ () -> String? in
					guard let serialNumber = Machine.serialNumber.value else { return nil }
					// swiftlint:disable:next explicit_type_interface
					let url = """
					https://support-sp.apple.com/sp/product?\
					cc=\(serialNumber.dropFirst(8))&\
					lang=\(Locale.currentLanguageCode ?? "")
					"""
					return await Network.string(from: url)?
						.between(start: "<configCode>", end: "</configCode>")
						.map(String.init)
				},
				applicable: Machine.serialNumber.value.map { [11, 12].contains($0.count) },
			)
			static let displayName = SystemInformationData<String?, _>(
				{ await localizedName.value ?? name.value },
				applicable: localizedName.applicable ||? name.applicable,
			)
			static let identifier = SystemInformationData<String?, _>(IORegistry(class: "IOPlatformExpertDevice").read("model"))
			static let namePrefix: String? = name.value?.remove(" ") ?? identifier.value
			static let number = SystemInformationData<String?, _>(
				{
					guard
						let modelNumber = IORegistry(class: "IOPlatformExpertDevice").read("model-number") as String?,
						let regionInfo = IORegistry(class: "IOPlatformExpertDevice").read("region-info") as String?
					else { return nil }
					return "\(modelNumber)\(regionInfo)"
				}(),
				applicable: CPU.type.value == .appleSilicon,
			)
			static let regulatoryNumber = SystemInformationData<String?, _>(
				IORegistry(class: "IOPlatformExpertDevice").read("regulatory-model-number"),
				applicable: CPU.type.value == .appleSilicon &&? !?isVirtualMachine,
			)
			static let sfSymbol = SystemInformationData<SFSymbol, _>({
				switch true {
					case isVirtualMachine: .macwindow
					case namePrefix?.hasPrefix("MacBook"):
						if #available(macOS 14, *) {
							switch true {
								case identifier.value == "Mac14,7": .macbookGen1
								case identifier.value?.hasPrefix("MacBookPro18"): .macbookGen2
								case identifier.value?.hasPrefix("MacBook"): .macbookGen1
								default: .macbookGen2
							}
						} else { .laptopcomputer }
					case namePrefix?.hasPrefix("iMac"): .desktopcomputer
					case namePrefix?.hasPrefix("Macmini"): .macmini
					case namePrefix?.hasPrefix("MacStudio"): if #available(macOS 13, *) { .macstudio } else { .macmini }
					case namePrefix?.hasPrefix("MacPro"):
						switch identifier.value {
							case "MacPro3,1", "MacPro4,1", "MacPro5,1": .macproGen1
							case "MacPro6,1": .macproGen2
							default: ["A2304", "A2787"].contains(regulatoryNumber.value) ? .macproGen3Server : .macproGen3
						}
					case namePrefix?.hasPrefix("Xserve"): .xserve
					default: if #available(macOS 15, *) { .desktopcomputerAndMacbook } else { .desktopcomputer }
				}
			}())
		}

		static let securityChip = SystemInformationData<SecurityChip?, _>({
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

				static let differentTypes: Bool? = type.value == .appleSilicon &&? !?Model.isVirtualMachine
				static let total = SystemInformationData<Int?, _>(Sysctl.read("hw.physicalcpu"))
				static let performance = SystemInformationData<Int?, _>(
					Sysctl.read("hw.perflevel0.physicalcpu"), applicable: differentTypes,
				)
				static let efficiency = SystemInformationData<Int?, _>(
					Sysctl.read("hw.perflevel1.physicalcpu"), applicable: differentTypes,
				)
			}

			static let type = SystemInformationData<CPUType, _>({
				#if arch(arm64)
					.appleSilicon
				#elseif arch(x86_64)
					.intel
				#else
					#error("Unsupported architecture")
				#endif
			}())
			static let name = SystemInformationData<String?, _>(Sysctl.read("machdep.cpu.brand_string"))
			static let frequency = SystemInformationData<Frequency?, _>(
				Sysctl.read("hw.cpufrequency").map(Frequency.init),
				applicable: type.value == .intel,
			)
		}

		static let memory = SystemInformationData<InformationStorage?, _>(
			Sysctl.read("hw.memsize").map(InformationStorage.init),
		)

		enum Machine {

			static let serialNumber = SystemInformationData<String?, _>(
				IORegistry(class: "IOPlatformExpertDevice").read(kIOPlatformSerialNumberKey),
			)
			static let hardwareUUID = SystemInformationData<String?, _>(
				IORegistry(class: "IOPlatformExpertDevice").read(kIOPlatformUUIDKey),
			)
			static let provisioningUDID = SystemInformationData<String?, _>(
				{ await SystemProfiler.hardware?["provisioning_UDID"] as? String ??
					(CPU.type.value == .intel ? hardwareUUID.value : nil) },
				applicable: SystemProfiler.available ||? CPU.type.value == .intel,
			)
		}
	}
	// swiftformat:enable organizeDeclarations
}
