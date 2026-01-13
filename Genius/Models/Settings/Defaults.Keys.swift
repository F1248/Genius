//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults

extension Defaults.Keys {

	static let useTextInsteadOfSymbols = Key<Bool>("UseTextInsteadOfSymbols", default: { Defaults[.interfaceMode] <= .simple })
	static let interfaceMode = Key<Settings.InterfaceMode>("InterfaceMode", default: .normal)
	static let disableLiquidGlass = Key<Bool>("DisableLiquidGlass", default: false)
	static let hideIconsInMenuBar = Key<Bool>("HideIconsInMenuBar", default: { Defaults[.disableLiquidGlass] })

	static let betaUpdates = Key<Bool>("BetaUpdates", default: false)

	static let developmentMode = Key<Bool>("DevelopmentMode", default: false)
}
