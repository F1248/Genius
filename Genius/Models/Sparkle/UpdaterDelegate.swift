//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import ObjectiveC
import Sparkle

final class UpdaterDelegate: NSObject, SPUUpdaterDelegate {

	func allowedChannels(for _: SPUUpdater) -> Set<String> {
		Defaults[.betaUpdates] ? ["beta"] : []
	}
}
