Pod::Spec.new do |s|
  s.name             = "TapDeviceClient"
  s.version          = "0.0.1-alpha.1"
  s.summary          = "TapDeviceClient is a Swift implementation of IoTize Tap device client"
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
  s.osx.deployment_target = '10.11'

  s.source_files          = 'Sources/Features/TapClient/Sources/**/*.swift', 'Sources/Features/TapClient/Sources/*.swift'

  s.swift_version = '4.0' 

  s.dependency 'TapClientApi', s.version.to_s
  s.dependency 'IotizeCore', s.version.to_s
  s.dependency 'RxSwift', '~> 4.0'
  s.dependency 'CryptoSwift', '~> 0.13'

end