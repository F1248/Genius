//
// © 2024 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

enum CPUType: UIStringRepresentable {

	case intel
	case appleSilicon

	var uiRepresentation: String? {
		{
			switch self {
				case .intel: "Intel"
				case .appleSilicon: "Apple Silicon"
			}
		}()
			.localized
	}
}
