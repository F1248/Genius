//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

@Suite("Bool string initialization tests")
struct BoolStringInitializationTests {

	@Test("Firmware Password tests")
	func firmwarePasswordTests() {
		#expect(Bool(firmwarepasswdOutput: "Password Enabled: Yes") == true)
		#expect(Bool(firmwarepasswdOutput: "Password Enabled: No") == false)
	}

	@Test("FileVault tests")
	func fileVaultTests() {
		#expect(Bool(fdesetupOutput: "FileVault is On.") == true)
		#expect(Bool(fdesetupOutput: "FileVault is On, but needs to be restarted to finish.") == false)
		#expect(Bool(fdesetupOutput: "FileVault is Off.") == false)
		#expect(Bool(fdesetupOutput: "FileVault is Off, but will be enabled after the next restart.") == false)
		#expect(Bool(fdesetupOutput: "FileVault is Off, but needs to be restarted to finish.") == false)
	}

	@Test("System Integrity Protection tests")
	func systemIntegrityProtectionTests() {
		#expect(Bool(csrutilOutput: "System Integrity Protection status: enabled.") == true)
		#expect(Bool(csrutilOutput: "System Integrity Protection status: enabled (Apple Internal).") == false)
		#expect(Bool(csrutilOutput: "System Integrity Protection status: disabled.") == false)
		#expect(Bool(csrutilOutput: "System Integrity Protection status: disabled (Apple Internal).") == false)
		#expect(Bool(csrutilOutput: "System Integrity Protection status: unknown (Custom Configuration).\n") == false)
	}

	@Test("Firewall tests")
	func firewallTests() {
		#expect(Bool(socketfilterfwOutput: "Firewall is enabled. (State = 1)") == true)
		#expect(Bool(socketfilterfwOutput: "Firewall is disabled. (State = 0)") == false)
	}

	@Test("Gatekeeper tests")
	func gatekeeperTests() {
		#expect(Bool(spctlOutput: "assessments enabled") == true)
		#expect(Bool(spctlOutput: "assessments disabled") == false)
	}
}
