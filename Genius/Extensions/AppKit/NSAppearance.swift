//
// © 2026 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import AppKit
import Foundation
import ObjectiveC

@available(macOS 26, *)
extension NSAppearance {

	@objc var hasLiquidGlass: Bool { false }

	static func disableLiquidGlass() {
		guard
			let nsSolariumClass = object_getClass(NSClassFromString("_NSSolarium")),
			let hasLiquidGlassImplementation = unsafe class_getMethodImplementation(self, #selector(getter: hasLiquidGlass))
		else { return }
		unsafe class_replaceMethod(
			nsSolariumClass,
			Selector(private: "isEnabled"),
			hasLiquidGlassImplementation,
			nil,
		)
		unsafe class_replaceMethod(
			self,
			Selector(private: "_wantsSolarium"),
			hasLiquidGlassImplementation,
			nil,
		)
	}
}
