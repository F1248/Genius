//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

extension BoolTests {

	@Suite("String initialization")
	struct StringInitialization {

		@Test()
		func firmwarepasswd() {
			#expect(Bool(firmwarepasswdOutput: "Password Enabled: Yes") == true)
			#expect(Bool(firmwarepasswdOutput: "Password Enabled: No") == false)
		}

		@Test()
		func fdesetup() {
			#expect(Bool(fdesetupOutput: "FileVault is On.") == true)
			#expect(Bool(fdesetupOutput: "FileVault is On, but needs to be restarted to finish.") == false)
			#expect(Bool(fdesetupOutput: "FileVault is Off.") == false)
			#expect(Bool(fdesetupOutput: "FileVault is Off, but will be enabled after the next restart.") == false)
			#expect(Bool(fdesetupOutput: "FileVault is Off, but needs to be restarted to finish.") == false)
		}

		@Test()
		func csrutil() {
			#expect(Bool(csrutilOutput: "System Integrity Protection status: enabled.") == true)
			#expect(Bool(csrutilOutput: "System Integrity Protection status: enabled (Apple Internal).") == false)
			#expect(Bool(csrutilOutput: "System Integrity Protection status: disabled.") == false)
			#expect(Bool(csrutilOutput: "System Integrity Protection status: disabled (Apple Internal).") == false)
			#expect(Bool(csrutilOutput: "System Integrity Protection status: unknown (Custom Configuration).\n") == false)
		}

		@Test()
		func socketfilterfw() {
			#expect(Bool(socketfilterfwOutput: "Firewall is enabled. (State = 1)") == true)
			#expect(Bool(socketfilterfwOutput: "Firewall is disabled. (State = 0)") == false)
		}

		@Test()
		func spctl() {
			#expect(Bool(spctlOutput: "assessments enabled") == true)
			#expect(Bool(spctlOutput: "assessments disabled") == false)
		}
	}
}
