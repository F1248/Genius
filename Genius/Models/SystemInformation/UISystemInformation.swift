//
// © 2026 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

protocol UISystemInformation<Representation>: SystemInformationProtocol {

	associatedtype Representation

	@MainActor var syncUIRepresentation: Representation?? { get }
	@MainActor var uiRepresentation: Representation? { get async }
}
