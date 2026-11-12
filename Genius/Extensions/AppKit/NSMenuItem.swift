//
// © 2026 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import AppKit
import ObjectiveC

@available(macOS 26, *)
extension NSMenuItem {

	static func hideIconsInMenuBar() {
		guard let method = unsafe class_getInstanceMethod(self, #selector(getter: image)) else { return }
		unsafe method_setImplementation(method, imp_implementationWithBlock({ nil } as @convention(block) () -> NSImage?))
	}
}
