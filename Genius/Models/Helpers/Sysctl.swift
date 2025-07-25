//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Darwin
import Foundation

enum Sysctl {

	// periphery:ignore:parameters attribute
	static func read<Wrapped: DataInitializable>(_ attribute: String) -> Wrapped? { // swiftlint:disable:this unused_parameter
		var size: Int = 0
		guard unsafe sysctlbyname(attribute, nil, &size, nil, 0) == 0, size > 0 else { return nil }
		var result = [UInt8](repeating: 0, count: size)
		guard unsafe sysctlbyname(attribute, &result, &size, nil, 0) == 0 else { return nil }
		return unsafe Wrapped(Data(bytes: result, count: result.lastIndex { $0 != 0 }.map(result.index(after:)) ?? 1))
	}
}
