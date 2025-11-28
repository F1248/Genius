//
// © 2025 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

@testable import Genius
import Testing

@Suite("SystemInformationProtocol")
struct SystemInformationProtocolTests {

	@Test
	func testCondition() { // swiftformat:disable:this swiftTestingTestCaseNames
		#expect(SystemInformationData<Int, _>(0 as Int).testCondition == true)
		#expect(SystemInformationData<Int?, _>(0, available: true).testCondition == true)
		#expect(SystemInformationData<Int?, _>(nil, available: true).testCondition == false)
		#expect(SystemInformationData<Int?, _>(0, available: false).testCondition == true)
		#expect(SystemInformationData<Int?, _>(nil, available: false).testCondition == true)
		#expect(SystemInformationData<Int?, _>(0, available: nil).testCondition == false)
		#expect(SystemInformationData<Int?, _>(nil, available: nil).testCondition == false)
	}
}
