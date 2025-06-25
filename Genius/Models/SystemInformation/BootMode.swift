//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

enum BootMode: UIStringRepresentable {

	case normal
	case safe
	case recovery

	nonisolated var uiRepresentation: String? {
		{
			switch self {
				case .normal: "Normal"
				case .safe: "Safe"
				case .recovery: "Recovery"
			}
		}()
			.localized
	}
}
