//
// Sysctl.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Darwin
import Foundation

enum Sysctl<W: DataInitializable> {

	static func read(_ name: String) -> W? {
		var size = 0 // swiftlint:disable:this explicit_type_interface
		guard sysctlbyname(name, nil, &size, nil, 0) == 0, size > 0 else { return nil }
		var result = [UInt8](repeating: 0, count: size)
		guard sysctlbyname(name, &result, &size, nil, 0) == 0 else { return nil }
		return W(Data(bytes: result, count: result.lastIndex { $0 != 0 }.map(result.index(after:)) ?? size))
	}
}
