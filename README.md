# ID3TagEditor

[![Build Status](https://travis-ci.org/chicio/ID3TagEditor.svg?branch=master)](https://travis-ci.org/chicio/ID3TagEditor?branch=master)
[![codebeat badge](https://codebeat.co/badges/cb9699d0-4287-4723-96f9-e1a72fa05406)](https://codebeat.co/projects/github-com-chicio-id3tageditor-master)
[![codecov](https://codecov.io/gh/chicio/ID3TagEditor/branch/master/graph/badge.svg)](https://codecov.io/gh/chicio/ID3TagEditor)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/chicio/ID3TagEditor/master/LICENSE.md)
[![Supported platform](https://img.shields.io/badge/platforms-macOS%20%7C%20iOS%20%7C%20tvOS%20%7C%20watchOS-orange.svg)](https://img.shields.io/badge/platforms-macOS%20%7C%20iOS%20%7C%20Apple%20TV%20%7C%20Apple%20Watch-orange.svg)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/ID3TagEditor.svg)](https://cocoapods.org/pods/ID3TagEditor)

![ID3TagEditor: A swift library to read and modify ID3 Tag of any mp3 file](https://raw.githubusercontent.com/chicio/ID3TagEditor/master/Assets/icon-logo-background.png 
"ID3TagEditor: A swift library to read and modify ID3 Tag of any mp3 file")

A swift library to read and modify ID3 Tag of any mp3 file. 

***

### Installation

There are three ways to install ID3TagEditor in your project: manual installation, as a stand-alone framework or using
cocoapods.

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
    pod 'ID3TagEditor', '~> 2.0'
end
```

and then run pod install (or pod update).

***

### Documentation

You can find the complete api documentation on [fabrizioduroni.it](https://www.fabrizioduroni.it/ID3TagEditor/ "ID3TagEditor doc").

***

### Usage

ID3Tag editor is compatible with the following platforms:

* iOS
* MacOS
* Apple Watch
* Apple TV

To read the ID3 tag of an mp3 file you can choose between two api contained in the `ID3TagEditor` class:
* `public func read(from path: String) throws -> ID3Tag?`
* `public func read(mp3: Data) throws -> ID3Tag?`

Below you can find a sample code of the api usage.

```swift
do {
    let id3TagEditor = ID3TagEditor()

    if let id3Tag = try id3TagEditor.read(from: "<valid path to the mp3 file>") {
        ...use the tag...
    }
    
    if let id3Tag = try id3TagEditor.read(mp3: "<valid mp3 file passed as Data>") {
        ...use the tag...
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
        artist: "an example artist",
        albumArtist: "an example album artist",
        album: "an example album",
        title: "an example title",
        recordingDateTime: RecordingDateTime(date: RecordingDate(day: 1, month: 10, year: 2019), 
                                             time: RecordingTime(hour: 14, minute: 30)),
        genre: Genre(genre: .ClassicRock, description: "Rock & Roll"),
        attachedPictures: AttachedPicture(picture: <NSData/Data of the image>, type: .FrontCover, format: .Jpeg),
        trackPosition: TrackPositionInSet(position: 2, totalTracks: 9)
    )
    
    try id3TagEditor.write(tag: id3Tag, to: "<valid path to the mp3 file that will be overwritten>"))
    try id3TagEditor.write(tag: id3Tag, 
                           to: "<valid path to the mp3 file>",
                           andSaveTo: "<new path where you want to save the mp3>"))
    let newMp3: Data = try id3TagEditor.write(tag: id3Tag, mp3: <valid mp3 file passed as Data>)                          
} catch {
    print(error)
}    
```  

The above methods use the `ID3Tag` class to describe a valid ID3 tag. This class contains various properties that could be
used to read/write a tag to the mp3 file.
Three versions of the tag are supported. They are described in the `ID3Version` enum:

* version 2.2, described by the enum value `.version2`  
* version 2.3, described by the enum value `.version3`  
* version 2.4, described by the enum value `.version4`

The ID3 supported properties are:

* `version`, as previously described
* `artist`, as a string containing the name of the song's artists
* `albumArtist`, as a string containing additional info about the artists 
* `album`, as a string containing the album title
* `title`, as a string containing the title of the song
* `recordingDateTime`, as an object composed by two other properties:
    * `date` as a `RecordingDate` object with three fields:
        * `day`, as a number that represents the recording day 
        * `month`, as a number that represents the recording month
        * `year`, as a number that represents the recording year
    * `time` as a `RecordingTime` object with two fields:
        * `hour`, as a number that represents the recording hour
        * `minute`, as a number that represents the recording minute
* `trackPosition`, as a `TrackPositionInSet` object containing the position of the track in the recording and the total number of track in the recordings
* `genre`, as a `Genre` object containing the `ID3Genre` identifier and/or a `description` of the song's genre
* `attachedPictures`, as an array of `AttachedPicture` objects containing the `Data` of an image, the `ID3PictureType` and the `ID3PictureFormat`

Only the `version` field is mandatory. The other fields are optional.
The field `artist`,  `albumArtist`, `title` and `album` are encoded/saved using Unicode 16 bit string (as requested by specification). 
The library is also able to read text frame wrongly encoded with Unicode (for example recordingDateTime must always be a ISO88591 string). 

***

### Examples

In the following screenshots you can find examples of the data extracted/updated. In the demo project you will find an example for each 
supported target.

<p align="center">
<img src="https://raw.githubusercontent.com/chicio/ID3TagEditor/master/Screenshots/04-example.png">
<img width="320" src="https://raw.githubusercontent.com/chicio/ID3TagEditor/master/Screenshots/01-example.png">
<img src="https://raw.githubusercontent.com/chicio/ID3TagEditor/master/Screenshots/03-example.png">
<img src="https://raw.githubusercontent.com/chicio/ID3TagEditor/master/Screenshots/02-example.png">
</p>
