//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

extension CaseIterable where Self: Equatable, AllCases.Index: DefaultInitializable {

	var index: AllCases.Index {
		Self.allCases.firstIndex(of: self).safeForceUnwrapped()
	}
}
