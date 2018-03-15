# ID3TagEditor

[![Build Status](https://travis-ci.org/chicio/ID3TagEditor.svg?branch=master)](https://travis-ci.org/chicio/ID3TagEditor?branch=master)
[![codebeat badge](https://codebeat.co/badges/cb9699d0-4287-4723-96f9-e1a72fa05406)](https://codebeat.co/projects/github-com-chicio-id3tageditor-master)
[![codecov](https://codecov.io/gh/chicio/ID3TagEditor/branch/master/graph/badge.svg)](https://codecov.io/gh/chicio/ID3TagEditor)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/chicio/ID3TagEditor/master/LICENSE.md)
[![Supported platform](https://img.shields.io/badge/platforms-macOS%20%7C%20iOS%20%7C%20tvOS%20%7C%20watchOS-orange.svg)](https://img.shields.io/badge/platforms-macOS%20%7C%20iOS%20%7C%20Apple%20TV%20%7C%20Apple%20Watch-orange.svg)

A swift library to read and modify ID3 Tag of any mp3 file. 

***

### Installation

There are three ways to install ID3TagEditor in your project: manual installation, as a stand-alone framework or using
cocoapods.

**Manual installation**

To manually install ID3TagEditor simply drag and drop all the file contained in the [Source](https://github.com/chicio/ID3TagEditor/tree/master/Source "Source") 
folder inside your project (except for the info.plist file).

**Framework**

ID3TagEditor is available also as a framework. You can follow the standard procedure to install a custom cocoa touch framework
(simply drag the RangeUISlider.xcodeproj inside your project and add it to the Embedded Binaries/Linked Frameworks and Libraries section of your 
project. See the demo project for a complete example of the setup of the framework.

**CocoaPods**

ID3TagEditor is also available as a pod on [CocoaPods](https://cocoapods.org/pods/ID3TagEditor "ID3TagEditor cocoapods").
Add the dependency to your Podfile (choose the release version you prefer):

```
target 'MyApp' do
    pod 'ID3TagEditor', '~> 1.0'
end
```

and then run pod install (or pod update).

***

### Usage

ID3Tag editor is compatible with the following platforms:

* iOS
* MacOS
* Apple Watch
* Apple TV

ID3TagEditor is really easy to use. To read the ID3 tag of an mp3 file use the `read` method of an instance of 
the `ID3TagEditor` class.  

```swift
do {
    let id3TagEditor = ID3TagEditor()

    if let id3Tag = try id3TagEditor.read(from: "<valid path to the mp3 file>") {
        ...use the tag...
    }
} catch {
    print(error)
}  
```

To write a new ID3 tag into an mp3 file use the `write` method of an instance of the `ID3TagEditor` class.

```swift
do {
    let id3Tag = ID3Tag(
        version: .version3,
        artist: "an example artist",
        album: "an example album",
        title: "an example title",
        year: "2019",
        genre: Genre(genre: .ClassicRock, description: "Rock & Roll"),
        attachedPictures: AttachedPicture(art: <NSData/Data of the image>, type: .FrontCover, format: .Jpeg),
        trackPosition: TrackPositionInSet(position: 2, totalTracks: 9)
    )
    try id3TagEditor.write(tag: id3Tag, to: PathLoader().pathFor(name: "example", fileType: "mp3"))
} catch {
    print(error)
}    
```  

The above methods use the `ID3Tag` class to describe a valid ID3 tag. The class contains various properties that could be
used to read/write a tag to the mp3 file.
Two versions of the tag are supported. They are described in the `ID3Version` enum:

* version 2.2, described by the enum value `.version2`  
* version 2.3, described by the enum value `.version3`  

The ID3 supported properties are:

* `version`, as previously described
* `artist`, as a string containing the name of the song's artists
* `title`, as a string containing the title of the song
* `trackPosition`, as a `TrackPositionInSet` object containing the position of the track in the recording and the total number of track in the recordings
* `album`, as a string containing the album title
* `year`, as a string containing the year of the recording
* `genre`, as a `Genre` object containing the `ID3Genre` identifier and/or a `description` of the song's genre
* `attachedPictures`, as an array of `AttachedPicture` objects containing the `Data` of an image, the `ID3PictureType` and the `ID3PictureFormat`

Only the `version` field is mandatory. The other fields are optional.

***

### Examples

In the following screenshots you can find examples of the data extracted/updated. In the demo project you will find an example for each
target supported.

<p align="center">
<img width="320" height="632" hspace="50" src="https://raw.githubusercontent.com/chicio/ID3TagEditor/master/Screenshots/01-example.png">
<img height="632" hspace="50" src="https://raw.githubusercontent.com/chicio/ID3TagEditor/master/Screenshots/02-example.png">
</p>
 

