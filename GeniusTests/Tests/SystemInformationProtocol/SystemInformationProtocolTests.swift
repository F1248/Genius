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
		#expect(SystemInformationData<Int?, _>(0, applicable: true).testCondition == true)
		#expect(SystemInformationData<Int?, _>(nil, applicable: true).testCondition == false)
		#expect(SystemInformationData<Int?, _>(0, applicable: false).testCondition == true)
		#expect(SystemInformationData<Int?, _>(nil, applicable: false).testCondition == true)
		#expect(SystemInformationData<Int?, _>(0, applicable: nil).testCondition == false)
		#expect(SystemInformationData<Int?, _>(nil, applicable: nil).testCondition == false)
	}
}
