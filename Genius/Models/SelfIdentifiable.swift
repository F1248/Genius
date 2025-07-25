//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

protocol SelfIdentifiable: Identifiable {}

extension SelfIdentifiable {

	var id: Self { self } // swiftlint:disable:this unused_declaration
}
