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
			let cacheDirectory: URL? = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
			let libraryDirectory: URL? = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first
			for url in [
				cacheDirectory?.appendingPathComponent(bundleIdentifier),
				libraryDirectory?.appendingPathComponent("HTTPStorages/\(bundleIdentifier)"),
				libraryDirectory?.appendingPathComponent("Preferences/\(bundleIdentifier).plist"),
			].compactMap(\.self) {
				try? FileManager.default.removeItem(at: url)
			}
		}
		try? FileManager.default.removeItem(at: Bundle.main.bundleURL)
		NSApp.terminate(nil)
	}
}
