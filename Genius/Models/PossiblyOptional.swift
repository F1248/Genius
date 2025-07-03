//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

protocol PossiblyOptional<Wrapped> {

	associatedtype Wrapped

	var optional: Wrapped? { get }
}

extension PossiblyOptional {

	var optional: Self? { self }
}

extension Optional: PossiblyOptional {

	var optional: Self { self }
}
