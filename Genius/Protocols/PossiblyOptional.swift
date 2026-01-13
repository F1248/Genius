//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

protocol PossiblyOptional<Wrapped> {

	associatedtype Wrapped

	var optional: Wrapped? { get }
}

extension PossiblyOptional {

	var optional: Self? { self } // swiftlint:disable:this unused_declaration
}

extension Optional: PossiblyOptional {

	var optional: Self { self }
}
