//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import os

extension Optional: UIStringRepresentable where Wrapped: UIStringRepresentable {

	var uiRepresentation: String? { get async {
		await self?.uiRepresentation
	} }
}

extension Optional: UISymbolRepresentable where Wrapped: UISymbolRepresentable {

	var uiRepresentation: Symbol? { get async {
		await self?.uiRepresentation
	} }
}

extension Optional where Wrapped: DefaultInitializable {

	func safeForceUnwrapped(
		file: String = #file,
		line: Int = #line,
		column: Int = #column,
		function: String = #function,
	) -> Wrapped {
		guard let self else {
			Logger().error(
				"Unexpectedly found nil while unwrapping an Optional value",
				file: file,
				line: line,
				column: column,
				function: function,
			)
			return Wrapped()
		}
		return self
	}
}

extension Optional {

	func safeForceUnwrapped(
		fallback: @autoclosure () -> Wrapped,
		file: String = #file,
		line: Int = #line,
		column: Int = #column,
		function: String = #function,
	) -> Wrapped {
		guard let self else {
			Logger().error(
				"Unexpectedly found nil while unwrapping an Optional value",
				file: file,
				line: line,
				column: column,
				function: function,
			)
			return fallback()
		}
		return self
	}
}

extension Optional where Wrapped: Equatable {

	static func ==? (lhs: Self, rhs: Self) -> Bool? {
		guard let lhs, let rhs else { return nil }
		return lhs == rhs
	}

	static func !=? (lhs: Self, rhs: Self) -> Bool? {
		!?(lhs ==? rhs)
	}
}

extension Optional where Wrapped: Comparable {

	static func >? (lhs: Self, rhs: Self) -> Bool? {
		guard let lhs, let rhs else { return nil }
		return lhs > rhs
	}

	static func <? (lhs: Self, rhs: Self) -> Bool? {
		guard let lhs, let rhs else { return nil }
		return lhs < rhs
	}

	static func >=? (lhs: Self, rhs: Self) -> Bool? {
		!?(lhs <? rhs)
	}

	static func <=? (lhs: Self, rhs: Self) -> Bool? {
		!?(lhs >? rhs)
	}
}
