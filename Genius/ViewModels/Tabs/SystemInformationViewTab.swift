//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import SwiftUI

enum SystemInformationViewTab: String, TabData {

	case hardware = "Hardware"
	case software = "Software"

	static let entireWindow = false // swiftlint:disable:this explicit_type_interface
	static let keyboardShortcutModifiers: EventModifiers = [.command, .option]

	var content: some View {
		switch self {
			case .hardware: SystemInformationHardwareView()
			case .software: SystemInformationSoftwareView()
		}
	}
}
