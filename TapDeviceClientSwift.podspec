Pod::Spec.new do |s|
  s.name             = "TapDeviceClientSwift"
  s.version          = "0.0.1-alpha.1"
  s.summary          = "TapDeviceClientSwift is a Swift implementation of Reactive Extensions"
  s.description      = <<-DESC
This is a Swift port of [IoTize Tap Device API](http://developer.iotize.com).

[IoTize](https://iotize.com)
                        DESC
  s.homepage         = "https://github.com/iotize-sas/TapDeviceClientSwift"
  s.license          = 'MIT'
  s.author           = { "Stephane Leonard" => "stephane.leonard@iotize.com" }
  s.source           = { :git => "https://github.com/iotize-sas/TapDeviceClientSwift.git", :tag => s.version.to_s }

  s.requires_arc          = true

  s.ios.deployment_target = '11.0'
  s.osx.deployment_target = '10.9'

  s.source_files          = 'Sources/Features/TapClient/Sources/**/*.swift'

  s.dependency 'TapClientApi', '~> 0.0.1.alpha.1'
  s.dependency 'RxSwift', '~> 4.0'
  s.dependency 'CryptoSwift', '~> 4.0'
  s.dependency 'IotizeCore', '~> 0.0.1.alpha.1'

end