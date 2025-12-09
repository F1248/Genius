//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import ObjectiveC

@dynamicMemberLookup
struct PrivateFramework {

	static let aboutSettings = Self(
		name: "AboutSettings",
		available: {
			if #available(macOS 15, *) { SystemInformation.Software.OS.bootMode.value !=? .recovery } else { false }
		}(),
	)

	let available: Bool?

	init(name: String, available: Bool? = true) {
		self.available = available
		guard
			available ?? true,
			let bundle = Bundle(path: "/System/Library/PrivateFrameworks/\(name).framework"),
			bundle.load()
		else { return }
	}

	subscript(dynamicMember className: String) -> NSObjectWrapper? {
		guard available ?? true else { return nil }
		return (NSClassFromString(className) as AnyObject as? NSObject).map(NSObjectWrapper.init)
	}
}
