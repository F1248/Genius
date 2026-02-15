//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import AppKit
import Defaults
import SwiftUI

@main
struct GeniusApp: App {

	@NSApplicationDelegateAdaptor var appDelegate: AppDelegate // swiftlint:disable:this unused_declaration

	var body: some Scene {
		WindowGroup {
			ContentView()
				.apply { if #available(macOS 26, *) { $0.toolbarBackgroundVisibility(.hidden, for: .automatic) } else { $0 } }
		}
		.windowToolbarStyle(.unified(showsTitle: false))
		.customWindowToolbarLabelStyleFixedIconOnly()
		.commands(content: AppCommands.init)
	}

	init() {
		if #available(macOS 26, *) {
			if Defaults[.disableLiquidGlass] { NSAppearance.disableLiquidGlass() }
			if Defaults[.hideIconsInMenuBar] { NSMenuItem.hideIconsInMenuBar() }
		}
		NSWindow.allowsAutomaticWindowTabbing = false
		if (SystemInformation.Software.OS.bootMode.value !=? .recovery) ?? true {
			_ = updater
		}
	}
}
