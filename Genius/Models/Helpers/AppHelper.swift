//
// AppHelper.swift
// Genius
//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import _Concurrency
import AppKit
import Defaults
import Foundation

enum AppHelper {

	@MainActor
	static func uninstall() {
		Defaults.removeAll()
		if let bundleIdentifier = Bundle.main.bundleIdentifier {
			if let cacheDirectory: URL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first {
				try? FileManager.default.removeItem(at: cacheDirectory.appendingPathComponent(bundleIdentifier))
			}
			if let libraryDirectory: URL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first {
				try? FileManager.default.removeItem(at: libraryDirectory.appendingPathComponent("HTTPStorages/\(bundleIdentifier)"))
				try? FileManager.default.removeItem(at: libraryDirectory.appendingPathComponent("Preferences/\(bundleIdentifier).plist"))
			}
		}
		try? FileManager.default.removeItem(at: Bundle.main.bundleURL)
		NSApp.terminate(nil)
	}
}
