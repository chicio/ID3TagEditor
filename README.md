# ID3TagEditor

![Build iOS](https://github.com/chicio/ID3TagEditor/workflows/Build%20iOS/badge.svg)
![Build macOS](https://github.com/chicio/ID3TagEditor/workflows/Build%20macOS/badge.svg)
![Build watchOS](https://github.com/chicio/ID3TagEditor/workflows/Build%20watchOS/badge.svg)
![Build tvOS](https://github.com/chicio/ID3TagEditor/workflows/Build%20tvOS/badge.svg)
![Build Linux](https://github.com/chicio/ID3TagEditor/workflows/Build%20Linux/badge.svg)
![SwiftLint](https://github.com/chicio/ID3TagEditor/workflows/SwiftLint/badge.svg)
[![codebeat badge](https://codebeat.co/badges/cb9699d0-4287-4723-96f9-e1a72fa05406)](https://codebeat.co/projects/github-com-chicio-id3tageditor-master)
[![codecov](https://codecov.io/gh/chicio/ID3TagEditor/branch/master/graph/badge.svg)](https://codecov.io/gh/chicio/ID3TagEditor)
[![Supported platform](https://img.shields.io/badge/platform-macOS%20%7C%20iOS%20%7C%20tvOS%20%7C%20watchOS%20%7C%20Linux%20Ubuntu-orange.svg)](https://img.shields.io/badge/platform-macOS%20%7C%20iOS%20%7C%20tvOS%20%7C%20watchOS%20%7C%20Linux%20Ubuntu-orange.svg)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/ID3TagEditor.svg)](https://cocoapods.org/pods/ID3TagEditor)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/chicio/ID3TagEditor/master/LICENSE.md)

A swift library to read and modify ID3 Tag of any mp3 file. Listed in the implementations section of the [official ID3 standard website id3.org](http://id3.org/Implementations "id3.org swift").

![ID3TagEditor: A swift library to read and modify ID3 Tag of any mp3 file](https://raw.githubusercontent.com/chicio/ID3TagEditor/master/Assets/icon-logo-background.png 
"ID3TagEditor: A swift library to read and modify ID3 Tag of any mp3 file")

***

### Installation

There are four ways to install ID3TagEditor in your project:

- manual installation
- framework 
- cocoapods
- Swift Package Manager (with support for linux platform)

**Manual installation**

To manually install ID3TagEditor simply drag and drop all the file contained in the [Source](https://github.com/chicio/ID3TagEditor/tree/master/Source "Source") 
folder inside your project (except for the info.plist file).

**Framework**

ID3TagEditor is also available as a framework. You can follow the standard procedure to install a custom Cocoa Touch framework.
Drag the ID3TagEditor.xcodeproj inside your project and add it to the Embedded Binaries/Linked Frameworks and Libraries section of your project. See the demo project for a complete example of the setup of the framework.

**CocoaPods**

ID3TagEditor is also available as a pod on [CocoaPods](https://cocoapods.org/pods/ID3TagEditor "ID3TagEditor cocoapods").
Add the dependency to your Podfile (choose the release version you prefer):

```
target 'MyApp' do
    pod 'ID3TagEditor', '~> 4.0'
end
```

and then run pod install (or pod update).

**Swift Package Manager**

ID3TagEditor is also available as a Swift Package for the Swift Package Manager. Add it to your dependecies in your  `Package.swift` file.
After that you can build your project with the command `swift build`, and eventually run you project (if it is an executable target) with the command `swift run`.
If you want you can also run tests using `swift test`.  

```
// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Demo Ubuntu",
    dependencies: [
        .package(url: "https://github.com/chicio/ID3TagEditor.git", from: "4.0.0")
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

ID3TagEditor is compatible with the following platforms:

* iOS
* MacOS
* Apple Watch
* Apple TV
* Linux (on distros where Swift is available)

ID3TagEditor let you read and write ID3Tag to your mp3 files.

#### Read

To read the ID3 tag of an mp3 file you can choose between two API contained in the `ID3TagEditor` class:
* `public func read(from path: String) throws -> ID3Tag?`
* `public func read(mp3: Data) throws -> ID3Tag?`

Below you can find a sample code of the API usage.

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

To write a new ID3 tag into an mp3 file you can choose between two API contained in the `ID3TagEditor` class:

* `public func write(tag: ID3Tag, to path: String, andSaveTo newPath: String? = nil) throws`
* `public func write(tag: ID3Tag, mp3: Data) throws -> Data`

The only way to create a valid `ID3Tag` you can use one of the tag builder available:

* `ID32v2TagBuilder`, a builder useful to create ID3 tag version 2.2
* `ID32v3TagBuilder`, a builder useful to create ID3 tag version 2.3
* `ID32v4TagBuilder`, a builder useful to create ID3 tag version 2.3

You can't create an instance of  `ID3Tag`  without one of the builders above.
Below you can find a sample code that will write an ID3Tag version 3 with all the frames supported by ID3TagEditor to an mp3 file.

```swift
do {
    let id3Tag = ID32v3TagBuilder()
        .title(frame: ID3FrameWithStringContent(content: "title V3"))
        .album(frame: ID3FrameWithStringContent(content: "album V3"))
        .albumArtist(frame: ID3FrameWithStringContent(content: "album artist V3"))
        .artist(frame: ID3FrameWithStringContent(content: "artist V3"))
        .composer(frame: ID3FrameWithStringContent(content: "composer V3"))
        .conductor(frame: ID3FrameWithStringContent(content: "conductor V3"))
        .contentGrouping(frame: ID3FrameWithStringContent(content: "ContentGrouping V3"))
        .copyright(frame: ID3FrameWithStringContent(content: "Copyright V3"))
        .encodedBy(frame: ID3FrameWithStringContent(content: "EncodedBy V3"))
        .encoderSettings(frame: ID3FrameWithStringContent(content: "EncoderSettings V3"))
        .fileOwner(frame: ID3FrameWithStringContent(content: "FileOwner V3"))
        .lyricist(frame: ID3FrameWithStringContent(content: "Lyricist V3"))
        .mixArtist(frame: ID3FrameWithStringContent(content: "MixArtist V3"))
        .publisher(frame: ID3FrameWithStringContent(content: "Publisher V3"))
        .subtitle(frame: ID3FrameWithStringContent(content: "Subtitle V3"))
        .beatsPerMinute(frame: ID3FrameWithIntegerContent(value: 50))
        .originalFilename(frame: ID3FrameWithStringContent(content: "filenameV3.mp3"))
        .lengthInMilliseconds(frame: ID3FrameWithIntegerContent(value: 9000))
        .sizeInBytes(frame: ID3FrameWithIntegerContent(value: 1500))
        .genre(frame: ID3FrameGenre(genre: .metal, description: "Metalcore"))
        .discPosition(frame: ID3FramePartOfTotal(part: 1, total: 3))
        .trackPosition(frame: ID3FramePartOfTotal(part: 2, total: 9))
        .recordingDayMonth(frame: ID3FrameRecordingDayMonth(day: 5, month: 8))
        .recordingYear(frame: ID3FrameRecordingYear(year: 2020))
        .recordingHourMinute(frame: ID3FrameRecordingHourMinute(hour: 15, minute: 39))
        .attachedPicture(pictureType: .frontCover, frame: ID3FrameAttachedPicture(picture: <picture as Data object>, type: .frontCover, format: .jpeg))
        .attachedPicture(pictureType: .backCover, frame: ID3FrameAttachedPicture(picture: <picture as Data object>, type: .backCover, format: .jpeg))
        .unsynchronisedLyrics(language: .ita, frame: ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.ita, contentDescription: "CD", content: "v3 ita unsync lyrics"))
        .unsynchronisedLyrics(language: .eng, frame: ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.eng, contentDescription: "CD", content: "v3 eng unsync lyrics"))
        .iTunesGrouping(frame: ID3FrameWithStringContent(content: "ItunesGrouping V3"))
        .iTunesMovementName(frame: ID3FrameWithStringContent(content: "MovementName V3"))
        .iTunesMovementIndex(frame: ID3FrameWithIntegerContent(value: 6))
        .iTunesMovementCount(frame: ID3FrameWithIntegerContent(value: 13))
        .iTunesPodcastCategory(frame: ID3FrameWithStringContent(content: "PodcastCategory V3"))
        .iTunesPodcastDescription(frame: ID3FrameWithStringContent(content: "PodcastDescription V3"))
        .iTunesPodcastID(frame: ID3FrameWithStringContent(content: "PodcastID V3"))
        .iTunesPodcastKeywords(frame: ID3FrameWithStringContent(content: "PodcastKeywords V3"))
        .build()
    
    try id3TagEditor.write(tag: id3Tag, to: "<valid path to the mp3 file that will be overwritten>")
    try id3TagEditor.write(tag: id3Tag, 
                           to: "<valid path to the mp3 file>",
                           andSaveTo: "<new path where you want to save the mp3>")
    let newMp3: Data = try id3TagEditor.write(tag: id3Tag, mp3: <valid mp3 file passed as Data>)                          
} catch {
    print(error)
}    
```  

Below you can find the list of the official ID3 frames supported by ID3TagEditor (see the enum `FrameName` and the builders shown above):

* `.title`
* `.album`
* `.albumArtist` 
* `.artist`
* `.composer`
* `.conductor`
* `.contentGrouping`
* `.copyright`
* `.encodedBy`
* `.encoderSettings`
* `.fileOwner`, available only for ID3 v2.3/v2.4
* `.lyricist`
* `.mixArtist`
* `.publisher`
* `.subtitle`
* `.beatsPerMinute`
* `.originalFilename`
* `.lengthInMilliseconds`
* `.sizeInBytes`,  available only for ID3 v2.2/v2.3
* `.genre`
* `.discPosition`
* `.trackPosition`
* `.recordingDayMonth`, available only for ID3 v2.2/v2.3
* `.recordingYear`, available only for ID3 v2.2/v2.3
* `.recordingHourMinute`, available only for ID3 v2.2/v2.3
* `.recordingDateTime`, available only for ID3 v2.4
* `.attachedPicture(_ pictureType: ID3PictureType)`, with support for multiple frames in the same tag distinguished by `ID3PictureType`
* `.unsynchronizedLyrics(_ language: ID3FrameContentLanguage)`, with support for multiple frames in the same tag distinguished by `ID3FrameContentLanguage`

In addition, ID3TagEditor supports the following iTunes unofficial frames:

* `.iTunesGrouping`, available only for ID3 v2.3/v2.4
* `.iTunesMovementName`, available only for ID3 v2.3/v2.4
* `.iTunesMovementIndex`, available only for ID3 v2.3/v2.4
* `.iTunesMovementCount`, available only for ID3 v2.3/v2.4
* `.iTunesPodcastCategory`, available only for ID3 v2.3/v2.4
* `.iTunesPodcastDescription`, available only for ID3 v2.3/v2.4
* `.iTunesPodcastID`, available only for ID3 v2.3/v2.4
* `.iTunesPodcastKeyword`, available only for ID3 v2.3/v2.4

All frames are encoded/formatted following the specification:
* text frames (frames with identifier starting with a capital T) uses UTF-16 to encode text
* frames with ad hoc encoding/formatting are supported (for example recordingDateTime must always be a ISO88591 string)
* frames with localized content (e.g. `.unsynchronizedLyrics`) support all the languages identifier contained in the ISO-639-2 (see `ID3FrameContentLanguage` for the complete list of supported languages).  
Refer to the [id3 specification](https://id3.org/Developer%20Information "id3 specification") for additional details.

***

### Documentation

You can find the complete API documentation on [fabrizioduroni.it](https://www.fabrizioduroni.it/ID3TagEditor/ "ID3TagEditor doc").

***

### Examples

In the following screenshots you can find examples of the data extracted/updated. In the [demo project]( https://github.com/chicio/ID3TagEditor/tree/master/Demo "demo id3tageditor") you will find an example for each 
supported target. You can also find more usage example in the [read/write acceptance test](https://github.com/chicio/ID3TagEditor/blob/master/Tests/Acceptance/ID3TagEditorWriteReadAcceptanceTest.swift "example acceptance tests").

<p align="center">
<img src="https://raw.githubusercontent.com/chicio/ID3TagEditor/master/Screenshots/04-example.png">
<img src="https://raw.githubusercontent.com/chicio/ID3TagEditor/master/Screenshots/01-example.png">
<img src="https://raw.githubusercontent.com/chicio/ID3TagEditor/master/Screenshots/03-example.png">
<img src="https://raw.githubusercontent.com/chicio/ID3TagEditor/master/Screenshots/02-example.png">
<img src="https://raw.githubusercontent.com/chicio/ID3TagEditor/master/Screenshots/05-example.png">
</p>

***
### Contributors

* [Nolaine Crusher](https://github.com/NCrusher74) (added 12 official frames + all unofficial non standard frames)
* [woko666](https://github.com/woko666) (added read from `Data` API)
* [martinjbaker](https://github.com/martinjbaker) (minor fixies)
* [Shabinder](https://github.com/Shabinder) (Kotlin Multiplatform support)
