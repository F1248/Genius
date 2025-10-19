//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import Sparkle

let updaterDelegate = UpdaterDelegate()
@MainActor let updater: SPUUpdater = SPUStandardUpdaterController(
	updaterDelegate: updaterDelegate,
	userDriverDelegate: nil,
).updater
