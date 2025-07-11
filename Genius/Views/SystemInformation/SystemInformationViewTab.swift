//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SFSafeSymbols
import SwiftUI

enum SystemInformationViewTab: String, TabData {

	case hardware = "Hardware"
	case software = "Software"

	static let entireWindow: Bool = false
	static let keyboardShortcutModifiers: EventModifiers = [.command, .option]

	var displayTitleInBody: Bool {
		true
	}

	var symbol: SFSymbol {
		switch self {
			case .hardware: SystemInformation.Hardware.Model.symbol
			case .software: .macwindowOnRectangle
		}
	}

	var content: some View {
		switch self {
			case .hardware: SystemInformationHardwareView()
			case .software: SystemInformationSoftwareView()
		}
	}
}
