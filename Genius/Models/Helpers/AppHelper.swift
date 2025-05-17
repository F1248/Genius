//
// AppHelper.swift
// Genius
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import AppKit
import Foundation

enum AppHelper {

	@MainActor
	static func uninstall() {
		guard let uninstallPath = Bundle.main.path(forResource: "Uninstall", ofType: nil) else { return }
		try? Process(uninstallPath)?.run()
		NSApp.terminate(nil)
	}
}
