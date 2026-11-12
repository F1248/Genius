//
// © 2026 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import AppKit
import Foundation
import ObjectiveC

@available(macOS 26, *)
extension NSAppearance {

	static func disableLiquidGlass() {
		guard
			let featureFlagsClass = NSClassFromString(
				{ if #available(macOS 27, *) { "_NSSwiftUICoreFeatureFlags" } else { "_NSSolarium" } }(),
			),
			let method1 = unsafe class_getClassMethod(featureFlagsClass, Selector(
				private: { if #available(macOS 27, *) { "isSolariumEnabled" } else { "isEnabled" } }(),
			)),
			let method2 = unsafe class_getInstanceMethod(self, Selector(private: "_wantsSolarium"))
		else { return }
		unsafe method_setImplementation(method1, imp_implementationWithBlock({ false } as @convention(block) () -> Bool))
		unsafe method_setImplementation(method2, imp_implementationWithBlock({ false } as @convention(block) () -> Bool))
	}
}
