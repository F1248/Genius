//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

enum AllowAccessoriesToConnectSetting: Comparable, Maximizable {

	case alwaysAllow
	case automaticallyAllowWhenUnlocked
	case askForNewAccessories
	case alwaysAsk

	static var max: Self { .alwaysAsk }
}
