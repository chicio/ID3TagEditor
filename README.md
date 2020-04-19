# ID3TagEditor

[![Build Status](https://travis-ci.org/chicio/ID3TagEditor.svg?branch=master)](https://travis-ci.org/chicio/ID3TagEditor?branch=master)
[![codebeat badge](https://codebeat.co/badges/cb9699d0-4287-4723-96f9-e1a72fa05406)](https://codebeat.co/projects/github-com-chicio-id3tageditor-master)
[![codecov](https://codecov.io/gh/chicio/ID3TagEditor/branch/master/graph/badge.svg)](https://codecov.io/gh/chicio/ID3TagEditor)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/chicio/ID3TagEditor/master/LICENSE.md)
[![Supported platform](https://img.shields.io/badge/platform-macOS%20%7C%20iOS%20%7C%20tvOS%20%7C%20watchOS%20%7C%20Linux%20Ubuntu-orange.svg)](https://img.shields.io/badge/platform-macOS%20%7C%20iOS%20%7C%20tvOS%20%7C%20watchOS%20%7C%20Linux%20Ubuntu-orange.svg)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/ID3TagEditor.svg)](https://cocoapods.org/pods/ID3TagEditor)

![ID3TagEditor: A swift library to read and modify ID3 Tag of any mp3 file](https://raw.githubusercontent.com/chicio/ID3TagEditor/master/Assets/icon-logo-background.png 
"ID3TagEditor: A swift library to read and modify ID3 Tag of any mp3 file")

A swift library to read and modify ID3 Tag of any mp3 file. Listed in the implementations section of the [official ID3 standard website id3.org](http://id3.org/Implementations "id3.org swift").

***

### Installation

There are four ways to install ID3TagEditor in your project:

- manual installation
- framework 
- cocoapods
- Swift Package Manager (support for linux platform)

**Manual installation**

To manually install ID3TagEditor simply drag and drop all the file contained in the [Source](https://github.com/chicio/ID3TagEditor/tree/master/Source "Source") 
folder inside your project (except for the info.plist file).

**Framework**

ID3TagEditor is also available as a framework. You can follow the standard procedure to install a custom cocoa touch framework
(simply drag the ID3TagEditor.xcodeproj inside your project and add it to the Embedded Binaries/Linked Frameworks and Libraries section of your
project. See the demo project for a complete example of the setup of the framework.

**CocoaPods**

ID3TagEditor is also available as a pod on [CocoaPods](https://cocoapods.org/pods/ID3TagEditor "ID3TagEditor cocoapods").
Add the dependency to your Podfile (choose the release version you prefer):

```
target 'MyApp' do
    pod 'ID3TagEditor', '~> 3.0'
end
```

and then run pod install (or pod update).

**Swift Package Manager**

ID3TagEditor is also available as Swift Package for the Swift Package Manager. To use it simply add it to your dependecies in the Swift  `Package.swift`.
After that you can build your project with the command `swift build`, and eventually run you project (if it is an executable type) with the command `swift run`.
If you want you can also run tests using `swift test`.  
  
  *IMPORTANT: at the moment some tests are excluded from  `swift test` because some test api are missing (eg. `XCTestExpectation`) or 
because the Bundle of resources in the test target doesn't work as expected.* 

```
// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Demo Ubuntu",
    dependencies: [
        .package(url: "https://github.com/chicio/ID3TagEditor.git", from: "3.0.0")
    ],
    targets: [
        .target(
            name: "Demo Ubuntu",
            dependencies: ["ID3TagEditor"]
        )
    ]
)
```

***

### Usage

ID3Tag editor is compatible with the following platforms:

* iOS
* MacOS
* Apple Watch
* Apple TV
* Linux Ubuntu

To read the ID3 tag of an mp3 file you can choose between two api contained in the `ID3TagEditor` class:
* `public func read(from path: String) throws -> ID3Tag?`
* `public func read(mp3: Data) throws -> ID3Tag?`

Below you can find a sample code of the api usage.

```swift
do {
    let id3TagEditor = ID3TagEditor()

    if let id3Tag = try id3TagEditor.read(from: "<valid path to the mp3 file>") {
        // ...use the tag...
        // For example to read the title, album and artist content you can do something similar
        print((id3Tag.frames[.Title] as?  ID3FrameWithStringContent)?.content ?? "")
        print((id3Tag.frames[.Artist] as? ID3FrameWithStringContent)?.content ?? "")
        print((id3Tag.frames[.Album] as? ID3FrameWithStringContent)?.content ?? "")
    }
    
    if let id3Tag = try id3TagEditor.read(mp3: "<valid mp3 file passed as Data>") {
        // ...use the tag...
        // For example to read the title, album and artist content you can do something similar
        print((id3Tag.frames[.Title] as?  ID3FrameWithStringContent)?.content ?? "")
        print((id3Tag.frames[.Artist] as? ID3FrameWithStringContent)?.content ?? "")
        print((id3Tag.frames[.Album] as? ID3FrameWithStringContent)?.content ?? "")
    }    
} catch {
    print(error)
}  
```

To write a new ID3 tag into an mp3 file you can choose between two api contained in the `ID3TagEditor` class:
* `public func write(tag: ID3Tag, to path: String, andSaveTo newPath: String? = nil) throws`
* `public func write(tag: ID3Tag, mp3: Data) throws -> Data`

Below you can find a sample code of the api usage.

```swift
do {
    let id3Tag = ID3Tag(
       version: .version3,
       frames: [
         .Artist : ID3FrameWithStringContent(content: "A New Artist"),
         .AlbumArtist : ID3FrameWithStringContent(content: "A New Album Artist"),
         .Album : ID3FrameWithStringContent(content: "A New Album"),
         .Title : ID3FrameWithStringContent(content:  "A New title"),
         .AttachedPicture(.FrontCover) : ID3FrameAttachedPicture(picture: art, type: .FrontCover, format: .Jpeg)
       ]
    )
    
    try id3TagEditor.write(tag: id3Tag, to: "<valid path to the mp3 file that will be overwritten>")
    try id3TagEditor.write(tag: id3Tag, 
                           to: "<valid path to the mp3 file>",
                           andSaveTo: "<new path where you want to save the mp3>")
    let newMp3: Data = try id3TagEditor.write(tag: id3Tag, mp3: <valid mp3 file passed as Data>)                          
} catch {
    print(error)
}    
```  

The above methods use the `ID3Tag` class to describe a valid ID3 tag. This class contains the tag properties in the field `properties` and the 
list of frames in the `frames` properties.
Three versions of the tag are supported. They are described in the `ID3Version` enum:

* version 2.2, described by the enum value `.version2`  
* version 2.3, described by the enum value `.version3`  
* version 2.4, described by the enum value `.version4`

The ID3 supported offcial frames supported are (see the enum `FrameName`):

* `.Artist`, artists frame 
* `.AlbumArtist`, album artist frame 
* `.Album`, album frame
* `.Title`, title frame
* `.RecordingDayMonth`, recording day month frame available only for ID3 v2.2/v2.3
* `.RecordingYear`, recording year frame available only for ID3 v2.2/v2.3
* `.RecordingHourMinute`, recording hour minute frame available only for ID3 v2.2/v2.3
* `.RecordingDateTime`, recording date time frame available only for ID3 v2.4
* `.TrackPosition`, track position frame
* `.Genre`, the genre frame
* `.AttachedPicture(_ pictureType: ID3PictureType)` the attached picture frame
* `Composer`
* `Conductor`
* `ContentGrouping`
* `Copyright`
* `DiscPosition`
* `EncodedBy`
* `EncoderSettings`
* `FileOwner`
* `Lyricist`
* `MixArtist`
* `Publisher`
* `Subtitle`

In addition, ID3TagEditor supports the following iTunes only unofficial frames:

* `iTunesGrouping`
* `iTunesMovementName`
* `iTunesMovementIndex` (aka movement number)
* `iTunesMovementCount`
* `iTunesPodcastCategory`
* `iTunesPodcastDescription`
* `iTunesPodcastID`
* `iTunesPodcastKeyword`

Only the `version` field is mandatory. The other fields are optional.
The field `artist`,  `albumArtist`, `title` and `album` are encoded/saved using Unicode 16 bit string (as requested by specification). 
The library is also able to read text frame wrongly encoded with Unicode (for example recordingDateTime must always be a ISO88591 string). 

***
### Contributors

* [Nolaine Crusher](https://github.com/NCrusher74) (added 12 official frames + all unofficial non standard frames)
* [woko666](https://github.com/woko666) (added read from `Data` api)
* [martinjbaker](https://github.com/martinjbaker) (minor fixies)

***

### Documentation

You can find the complete api documentation on [fabrizioduroni.it](https://www.fabrizioduroni.it/ID3TagEditor/ "ID3TagEditor doc").

***

### Examples

In the following screenshots you can find examples of the data extracted/updated. In the demo project you will find an example for each 
supported target.

<p align="center">
<img src="https://raw.githubusercontent.com/chicio/ID3TagEditor/master/Screenshots/04-example.png">
<img width="320" src="https://raw.githubusercontent.com/chicio/ID3TagEditor/master/Screenshots/01-example.png">
<img src="https://raw.githubusercontent.com/chicio/ID3TagEditor/master/Screenshots/03-example.png">
<img src="https://raw.githubusercontent.com/chicio/ID3TagEditor/master/Screenshots/02-example.png">
<img src="https://raw.githubusercontent.com/chicio/ID3TagEditor/master/Screenshots/05-example.png">
</p>
