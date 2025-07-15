//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import AppKit
import SwiftUI

@main
struct GeniusApp: App {

	@NSApplicationDelegateAdaptor var appDelegate: AppDelegate // swiftlint:disable:this unused_declaration

	var body: some Scene {
		WindowGroup {
			if #available(macOS 26, *) {
				ContentView()
					.toolbarBackgroundVisibility(.hidden, for: .automatic)
			} else {
				ContentView()
			}
		}
		.windowToolbarStyle(.unified(showsTitle: false))
		.commands {
			AppCommands()
		}
	}

	init() {
		NSWindow.allowsAutomaticWindowTabbing = false
	}
}
