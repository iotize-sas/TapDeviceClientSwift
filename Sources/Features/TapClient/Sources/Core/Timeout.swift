import Foundation

/// Timeout wrapps a callback deferral that may be cancelled.
///
/// Usage:
/// Timeout(1.0) { println("1 second has passed.") }
///
class Timeout: NSObject
{
	private var timer: Timer?
	private var callback: (() -> Void)?
	
	init(_ delaySeconds: Double, _ callback: () -> Void)
	{
		super.init()
//		self.callback = callback
		self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(delaySeconds),
															target: self, selector: "invoke", userInfo: nil, repeats: false)
	}
	
	func invoke()
	{
		self.callback?()
		// Discard callback and timer.
		self.callback = nil
		self.timer = nil
	}
	
	func cancel()
	{
		self.timer?.invalidate()
		self.timer = nil
	}
}
