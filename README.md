# IoTize Tap device Client 

Swift Tap device client implementation. 

**Warning**: This is an early-stage library. It does not contains all the features; Future release may introduce breaking changes. It may be unstable

[API Documentation](http://developer.iotize.com)

[IoTize](https://iotize.com)

# Usage
For the full documentation, refer to the [Tap API documentation website](http://developer.iotize.com)


# Installation

## [CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html) 

Tested with pod --version: 1.4.0

```ruby
# Podfile
use_frameworks!

target 'YOUR_TARGET_NAME' do
    # Add the core library
    pod 'TapDeviceClient',    '~> 0.0.1-alpha.1'

    # Add communication libraries according to your needs
    # If you want to communicate though sockets with your Tap device
    pod 'TapSocketProtocol',    '~> 0.0.1-alpha.1'

    # If you want to communicate though BLE with your Tap device (Not available yet)
    # pod 'TapBLEProtocol',    '~> 0.0.1-alpha.1'
end
```

## Road map

- [ ] BLE protocol implementation
- [ ] Improve error managment
- [ ] Increase test coverage
- [ ] Add an iOS demo application
- [ ] Target lower iOS and OSX version

## Contribute

This project use Xcodegen tool to setup xcode project

### SwiftGen

```bash
swiftgen config run --config tools/swiftgen/swiftgen.yml
 ```
### XcodeGen

xcodegen file are genereted with `xcodegen` tool.

```bash
xcodegen && open ./TapDeviceClient.xcodeproj
```

### Carthage

```bash
cd ./Tools/Carthage && carthage update --no-use-binary
```
