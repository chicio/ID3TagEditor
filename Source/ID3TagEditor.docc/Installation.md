# Installation

There are three ways to install ID3TagEditor in your project:

- Swift Package Manager (with support for linux platform)
- manual installation
- cocoapods

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
        .package(url: "https://github.com/chicio/ID3TagEditor.git", from: "5.0.0")
    ],
    targets: [
        .target(
            name: "Demo Ubuntu",
            dependencies: ["ID3TagEditor"]
        )
    ]
)
```

### CocoaPods

ID3TagEditor is also available as a pod on [CocoaPods](https://cocoapods.org/pods/ID3TagEditor "ID3TagEditor cocoapods").
Add the dependency to your Podfile (choose the release version you prefer):

```ruby
target 'MyApp' do
    pod 'ID3TagEditor', '~> 5.0'
end
```

and then run pod install (or pod update).

### Manual installation

To manually install ID3TagEditor simply drag and drop all the file contained in the [Source](https://github.com/chicio/ID3TagEditor/tree/main/Source "Source") 
folder inside your project (except for the info.plist file).
