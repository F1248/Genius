//
// SystemImageManager.swift
// Genius
//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

func systemImageFallback(_ name: String) -> String {
	switch name {
	case "desktopcomputer.and.macbook": if #unavailable(macOS 15) { return "desktopcomputer" }
	default: break
	}
	return name
}
