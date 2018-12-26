## Commands
#SwiftGen: swiftgen config run --config tools/swiftgen/swiftgen.yml
# XcodeGen: 

rm -R ./Starter.xcodeproj && xcodegen && open ./Starter.xcodeproj

carthage update --no-use-binary
