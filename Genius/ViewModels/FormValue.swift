//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

protocol FormValue: Sendable {

	associatedtype ViewType: View

	@MainActor @ViewBuilder var formView: ViewType { get }
}
