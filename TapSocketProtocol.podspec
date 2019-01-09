Pod::Spec.new do |s|
  s.name             = "TapSocketProtocol"
  s.version          = "0.0.1-alpha.2"
  s.summary          = "Socket and websocket protocol implementation to communicate with IoTize Tap device"
  s.description      = <<-DESC
This is a Swift port Socket protocol [IoTize Tap Device API](http://developer.iotize.com).

[IoTize](https://iotize.com)
                        DESC
  s.homepage         = "https://github.com/iotize-sas/TapDeviceClientSwift"
  s.license          = 'MIT'
  s.author           = { "Stephane Leonard" => "stephane.leonard@iotize.com" }
  s.source           = { :git => "https://github.com/iotize-sas/TapDeviceClientSwift.git", :tag => s.version.to_s }

  s.requires_arc          = true

  s.ios.deployment_target = '11.0'
  s.osx.deployment_target = '10.11'

  s.source_files          = 'Sources/Features/TapSocketProtocol/Sources/*.swift'

  s.swift_version = '4.0' 
    
  s.dependency 'BlueSocket', '~> 1.0'
  s.dependency 'IotizeCore', '~> 0.0.1-alpha.1'
  s.dependency 'TapClientApi', '~> 0.0.1-alpha.1'

end