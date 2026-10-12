//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Darwin
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
	static let iconServices = Self(name: "IconServices")
	static let powerPreferences = Self(
		executable: "/System/Library/ExtensionKit/Extensions/PowerPreferences.appex/Contents/MacOS/PowerPreferences",
		available: SystemInformation.Software.OS.bootMode.value !=? .recovery,
	)

	let available: Bool?
	let loaded: Bool

	init(name: String, available: Bool? = true) {
		self.available = available
		guard
			available ?? true,
			let bundle = Bundle(path: "/System/Library/PrivateFrameworks/\(name).framework"),
			bundle.load()
		else {
			self.loaded = false
			return
		}
		self.loaded = true
	}

	init(executable executablePath: String, available: Bool? = true) {
		self.available = available
		guard
			available ?? true,
			unsafe dlopen(executablePath, 0) != nil
		else {
			self.loaded = false
			return
		}
		self.loaded = true
	}

	subscript(dynamicMember className: String) -> NSObjectWrapper? {
		guard loaded else { return nil }
		return (NSClassFromString(className) as AnyObject as? NSObject).map(NSObjectWrapper.init)
	}
}
