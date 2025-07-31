//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

extension BoolTests {

	@Suite("String initialization")
	struct StringInitialization {

		@Test("Firmware Password")
		func firmwarePassword() {
			#expect(Bool(firmwarepasswdOutput: "Password Enabled: Yes") == true)
			#expect(Bool(firmwarepasswdOutput: "Password Enabled: No") == false)
		}

		@Test("FileVault")
		func fileVault() {
			#expect(Bool(fdesetupOutput: "FileVault is On.") == true)
			#expect(Bool(fdesetupOutput: "FileVault is On, but needs to be restarted to finish.") == false)
			#expect(Bool(fdesetupOutput: "FileVault is Off.") == false)
			#expect(Bool(fdesetupOutput: "FileVault is Off, but will be enabled after the next restart.") == false)
			#expect(Bool(fdesetupOutput: "FileVault is Off, but needs to be restarted to finish.") == false)
		}

		@Test("System Integrity Protection")
		func systemIntegrityProtection() {
			#expect(Bool(csrutilOutput: "System Integrity Protection status: enabled.") == true)
			#expect(Bool(csrutilOutput: "System Integrity Protection status: enabled (Apple Internal).") == false)
			#expect(Bool(csrutilOutput: "System Integrity Protection status: disabled.") == false)
			#expect(Bool(csrutilOutput: "System Integrity Protection status: disabled (Apple Internal).") == false)
			#expect(Bool(csrutilOutput: "System Integrity Protection status: unknown (Custom Configuration).\n") == false)
		}

		@Test("Firewall")
		func firewall() {
			#expect(Bool(socketfilterfwOutput: "Firewall is enabled. (State = 1)") == true)
			#expect(Bool(socketfilterfwOutput: "Firewall is disabled. (State = 0)") == false)
		}

		@Test("Gatekeeper")
		func gatekeeper() {
			#expect(Bool(spctlOutput: "assessments enabled") == true)
			#expect(Bool(spctlOutput: "assessments disabled") == false)
		}
	}
}
