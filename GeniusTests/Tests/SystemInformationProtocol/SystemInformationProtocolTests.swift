//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

@Suite("SystemInformationProtocol")
struct SystemInformationProtocolTests {

	@Test
	func test() {
		#expect(SystemInformationData<Int, _>(0 as Int).test == true)
		#expect(SystemInformationData<Int?, _>(0, available: true).test == true)
		#expect(SystemInformationData<Int?, _>(nil, available: true).test == false)
		#expect(SystemInformationData<Int?, _>(0, available: false).test == true)
		#expect(SystemInformationData<Int?, _>(nil, available: false).test == true)
		#expect(SystemInformationData<Int?, _>(0, available: nil).test == false)
		#expect(SystemInformationData<Int?, _>(nil, available: nil).test == false)
	}
}
