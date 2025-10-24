//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import Foundation
import SFSafeSymbols
import SwiftUI

enum SystemInformationViewTab: @MainActor TabData {

	case hardware
	case software

	static let entireWindow: Bool = false
	static let keyboardShortcutModifiers: EventModifiers = [.command, .option]

	var title: LocalizedStringResource { switch self {
		case .hardware: .hardware
		case .software: .software
	} }

	var symbol: SFSymbol { switch self {
		case .hardware: SystemInformation.Hardware.Model.symbol
		case .software: .macwindowOnRectangle
	} }

	var content: some View { switch self {
		case .hardware: SystemInformationHardwareView()
		case .software: SystemInformationSoftwareView()
	} }
}
