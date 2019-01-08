import Foundation
import UIKit
import XCTest

@testable import Starter

class TestAppDelegate: NSObject, UIApplicationDelegate {
	var window: UIWindow?
}

class AppDelegateTests: XCTestCase {

	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

	func testSharedAppDelegateIsTestAppDelegate() {
		XCTAssertTrue(UIApplication.shared.delegate is TestAppDelegate)
	}
}
