//
// Sysctl.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Darwin
import Foundation

enum Sysctl<W: SysctlValue> {

	static func read(_ name: String) -> W? {
		var size = 0 // swiftlint:disable:this explicit_type_interface
		guard sysctlbyname(name, nil, &size, nil, 0) == 0, size > 0 else { return nil }
		var result = [UInt8](repeating: 0, count: size)
		guard sysctlbyname(name, &result, &size, nil, 0) == 0 else { return nil }
		let data = Data(bytes: result, count: result.lastIndex { $0 != 0 }.map(result.index(after:)) ?? size)
		return switch W.self {
		case is Bool.Type: (data[0] == 0 ? false : data[0] == 1 ? true : nil) as? W
		case is Int.Type: data.reversed().reduce(0) { $0 << 8 | Int($1) } as? W
		case is String.Type: String(data) as? W
		default: nil
		}
	}
}
