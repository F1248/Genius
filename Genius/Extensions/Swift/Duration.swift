//
// © 2026 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

extension Duration {

	static func minutes(_ minutes: Double) -> Self { .seconds(60 * minutes) }
	static func hours(_ hours: Double) -> Self { .minutes(60 * hours) }
	static func days(_ days: Double) -> Self { .hours(24 * days) }
	static func weeks(_ weeks: Double) -> Self { .days(7 * weeks) }
}
