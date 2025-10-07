//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import Combine

actor SharedData: ObservableObject {

	static let sharedData = SharedData()

	@MainActor @Published var selectedTabsIndices: [ObjectIdentifier: Int] = [:]
	@MainActor @Published var showUninstallationDialog: Bool = false
}
