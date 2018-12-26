import UIKit
import Home
//import RxSwift
//import RxCocoa
import Core

class AppDelegate : UIResponder, UIApplicationDelegate {

	var window : UIWindow?

	/// Called from the system (it's private: not accessible in the testing environment)
	private override init() {
//		self.injector = Injector.resolve()
		super.init()
	}

//	/// Called in a testing environment
//	init(injector: Injector) {
//		self.injector = injector
//		super.init()
//	}

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {

		let window = UIWindow()
		window.rootViewController = UINavigationController(rootViewController: UIViewController())
		window.makeKeyAndVisible()
		self.window = window
		return true
	}

	func test(withColor color: UIColor) {

	}
}
