//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Foundation

protocol PickerSetting: CaseIterable, SelfIdentifiable where AllCases == [Self] {

	var title: LocalizedStringResource { get }
}
