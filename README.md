# Installation

## SwiftGen

```bash
swiftgen config run --config tools/swiftgen/swiftgen.yml
 ```
## XcodeGen

xcodegen file are genereted with `xcodegen` tool.

```bash
rm -R ./Starter.xcodeproj && xcodegen && open ./Starter.xcodeproj
```

## Carthage

```bash
cd ./Tools/Carthage && carthage update --no-use-binary
```
