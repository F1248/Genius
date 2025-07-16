//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

@Suite("SystemInformation")
struct SystemInformationTests {}

extension Optional {

	var testCondition: Bool {
		self != nil
	}
}

extension SystemInformationProtocol {

	var testCondition: Bool { get async {
		guard let applicable else { return false }
		guard applicable else { return true }
		if case Optional<Any>.none = await value as Any { return false }
		return true
	} }
}
