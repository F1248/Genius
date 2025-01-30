//
// IORegistryName.swift
// Genius
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

enum IORegistryName {

	static let nvramVariables: String =
		switch SystemInformation.Hardware.CPU.type.value {
			case .appleSilicon: "IODTNVRAMVariables"
			case .intel: "AppleEFINVRAM"
		}
}
