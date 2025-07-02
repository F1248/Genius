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
		if let applicable {
			if applicable {
				if case Optional<Any>.none = await value as Any {
					false
				} else { true }
			} else { true }
		} else { false }
	} }
}
