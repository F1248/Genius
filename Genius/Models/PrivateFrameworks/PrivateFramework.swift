//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import ObjectiveC

@dynamicMemberLookup
struct PrivateFramework {

	init(name: String) {
		guard
			let bundle = Bundle(path: "/System/Library/PrivateFrameworks/\(name).framework"),
			bundle.load()
		else { return }
	}

	subscript(dynamicMember className: String) -> NSObjectWrapper? {
		(NSClassFromString(className) as AnyObject as? NSObject).map(NSObjectWrapper.init)
	}
}
