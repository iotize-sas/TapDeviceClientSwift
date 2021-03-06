Pod::Spec.new do |s|
  s.name             = "TapClientApi"
  s.version          = "0.0.1-alpha.1"
  s.summary          = "IoTize tap device API definition"
  s.description      = <<-DESC
This is a Swift port of [IoTize Tap Device API](http://developer.iotize.com) API.

**Note:** It does not contain the implementation. Only protocol definitions

[IoTize](https://iotize.com)
                        DESC
  s.homepage         = "https://github.com/iotize-sas/TapDeviceClientSwift"
  s.license          = 'MIT'
  s.author           = { "Stephane Leonard" => "stephane.leonard@iotize.com" }
  s.source           = { :git => "https://github.com/iotize-sas/TapDeviceClientSwift.git", :tag => s.version.to_s }

  s.requires_arc          = true

  s.ios.deployment_target = '11.0'
  s.osx.deployment_target = '10.11'

  s.source_files          = 'Sources/Features/TapClientApi/Sources/*.swift'

  s.swift_version = '4.0' 
    
  s.dependency 'RxSwift', '~> 4.0'

end