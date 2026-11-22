# Installation

There are two ways to install ID3TagEditor in your project:

- Swift Package Manager (with support for linux platform)
- manual installation

CocoaPods is no longer supported: see the "CocoaPods (no longer supported)" section at the end of this page.

### Swift Package Manager

ID3TagEditor is available as a Swift Package for the Swift Package Manager. Add it to your dependecies in your `Package.swift` file.
After that you can build your project with the command `swift build`, and eventually run you project (if it is an executable target) with the command `swift run`.
If you want you can also run tests using `swift test`.  

```swift
// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "Demo Ubuntu",
    dependencies: [
        .package(url: "https://github.com/chicio/ID3TagEditor.git", from: "6.0.0")
    ],
    targets: [
        .target(
            name: "Demo Ubuntu",
            dependencies: ["ID3TagEditor"]
        )
    ]
)
```

### Manual installation

To manually install ID3TagEditor simply drag and drop all the file contained in the [Source](https://github.com/chicio/ID3TagEditor/tree/main/Source "Source") 
folder inside your project (except for the info.plist file).

### CocoaPods (no longer supported)

Starting from version 6.0.0, ID3TagEditor is no longer published on [CocoaPods](https://cocoapods.org/pods/ID3TagEditor "ID3TagEditor cocoapods").
The last version available there is 5.6.0. If your project still uses CocoaPods, pin that version in your Podfile:

```ruby
target 'MyApp' do
    pod 'ID3TagEditor', '5.6.0'
end
```

New features and fixes are only released through the Swift Package Manager, so we recommend migrating to it.
