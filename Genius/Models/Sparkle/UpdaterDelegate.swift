//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import ObjectiveC
import Sparkle

actor UpdaterDelegate: NSObject, SPUUpdaterDelegate {

	nonisolated func allowedChannels(for _: SPUUpdater) -> Set<String> {
		Defaults[.betaUpdates] ? ["beta"] : []
	}
}
