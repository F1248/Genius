//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius

extension SystemInformationProtocol {

	var testCondition: Bool { get async {
		guard let available else { return false }
		guard available else { return true }
		if case Optional<Any>.none = await value as Any { return false }
		return true
	} }
}

extension SystemInformationProtocol where ValueWrapper == SyncValueWrapper<Value> {

	var testCondition: Bool {
		guard let available else { return false }
		guard available else { return true }
		if case Optional<Any>.none = value as Any { return false }
		return true
	}
}
