//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation
import ObjectiveC

@dynamicMemberLookup
struct NSObjectWrapper {

	let object: NSObject

	func initialize() -> Self? {
		((object as? NSObject.Type)?.init()).map(Self.init)
	}

	func value<Type>(_ key: String) -> Type? {
		object.value(forKey: key) as? Type
	}

	subscript(dynamicMember selector: String) -> Self? {
		(self[dynamicMember: selector] as NSObject?).map(Self.init)
	}

	subscript<Type>(dynamicMember selector: String) -> Type? {
		object.performSafe(Selector(selector)) as? Type
	}
}
