# Change Log
All changes to ID3TagEditor will be documented in this file.

## [5.4.0](https://github.com/chicio/ID3TagEditor/releases/tag/5.4.0)
Release date: 2025-04-15

#### Fixed
- PR #112: Crash when parsing invalid frame sizes larger than ID3Tag

## [5.3.0](https://github.com/chicio/ID3TagEditor/releases/tag/5.3.0)
Release date: 2025-03-08

#### Added
- PR #109: Added support for Initial Key (TKEY) frame

## [5.2.0](https://github.com/chicio/ID3TagEditor/releases/tag/5.2.0)
Release date: 2024-10-24

#### Added
- PR #106: Avoid reading the whole file into memory when updating ID3 tag of a file
- clean up broke docc and allTests static properties

## [5.1.0](https://github.com/chicio/ID3TagEditor/releases/tag/5.1.0)
Release date: 2024-10-13

#### Added
- documentation is now generated with Swift docc

## [5.0.0](https://github.com/chicio/ID3TagEditor/releases/tag/5.0.0)
Release date: 2024-10-12

#### Added
- Swift 6 
- Swift Testing
- All demo now based on new targets and SwiftUI

#### Fixed
- Broken isoLatin1 support on Linux platforms, now fallback to utf-8 

## [4.6.0](https://github.com/chicio/ID3TagEditor/releases/tag/4.6.0)
Release date: 2023-04-19

#### Added
- PR #100: ID3FrameStringContentParser crash fix 

## [4.5.0](https://github.com/chicio/ID3TagEditor/releases/tag/4.5.0)
Release date: 2023-01-13

#### Added
- PR #99: Add optimized reader that only read the ID3 header of the file 

## [4.4.2](https://github.com/chicio/ID3TagEditor/releases/tag/4.4.2)
Release date: 2022-11-16

#### Fixed
- Updated doc: added comment frame description and usage 

## [4.4.1](https://github.com/chicio/ID3TagEditor/releases/tag/4.4.1)
Release date: 2022-11-13

#### Fixed
- PR #94: chore: Fix an out of bounds crash 

## [4.4.0](https://github.com/chicio/ID3TagEditor/releases/tag/4.4.0)
Release date: 2022-10-02

#### Fixed
- PR #93: chore: Fixes documentation for examples
- PR #92: Wire up iTunesGrouping to the ID3TagContentReader 
- Added automatic contributors list generation

## [4.3.0](https://github.com/chicio/ID3TagEditor/releases/tag/4.3.0)
Release date: 2022-09-09

#### Fixed
- Added support for widget extension

## [4.2.1](https://github.com/chicio/ID3TagEditor/releases/tag/4.2.1)
Release date: 2022-02-11

#### Fixed
- Fixed #88: ID3 v2.4 non synchsafe size 

## [4.2.0](https://github.com/chicio/ID3TagEditor/releases/tag/4.2.0)
Release date: 2022-02-11

#### Added
- Added `ID3TagContentReader` to make read content easier 


## [4.1.3](https://github.com/chicio/ID3TagEditor/releases/tag/4.1.3)
Release date: 2021-10-06

#### Added
- Xcode 13 support 

## [4.1.2](https://github.com/chicio/ID3TagEditor/releases/tag/4.1.2)
Release date: 2021-04-26

#### Fixed
- PR #85: Kotlin Multiplatform support 

## [4.1.1](https://github.com/chicio/ID3TagEditor/releases/tag/4.1.1)
Release date: 2020-12-19

#### Fixed
- Fixed #75: Crash when parsing COMM frame with encoding different from UTF-16 


## [4.1.0](https://github.com/chicio/ID3TagEditor/releases/tag/4.1.0)
Release date: 2020-11-23

#### Added
- Added `.beatsPerMinute` frame support
- Added `.originalFilename` frame support
- Added `.lengthInMilliseconds` frame support
- Added `.sizeInBytes` frame support (available only for ID3 v2.2/v2.3)
- Improved builders api (now builder docs will be much more clear)


## [4.0.0](https://github.com/chicio/ID3TagEditor/releases/tag/4.0.0)
Release date: 2020-10-26

#### Added
- Added Unsynchronised lyrics frame support
- Added SwiftLint for linting
- New API for create a tag with a valid list of frames: ID32v2TagBuilder, ID32v3TagBuilder and ID32v4TagBuilder

#### Fixed
- Codecov integration
- General improvement to tests: Linux tests extensions in each specific file


## [3.3.3](https://github.com/chicio/ID3TagEditor/releases/tag/3.3.3)
Release date: 2020-10-09

#### Added
- All public API enums now are iterable, equatable and hashable

#### Fixed
- Fixed #37: ID3 v2.4 AttachedPicture synchsafe size error 


## [3.3.2](https://github.com/chicio/ID3TagEditor/releases/tag/3.3.2)
Release date: 2020-09-30

#### Fixed
- Fixed #36: tags not wirtten after attached pictures frame


## [3.3.1](https://github.com/chicio/ID3TagEditor/releases/tag/3.3.1)
Release date: 2020-09-28

#### Fixed
- removed Info.plist from SwiftPM build 


## [3.3.0](https://github.com/chicio/ID3TagEditor/releases/tag/3.3.0)
Release date: 2020-09-25

#### Added
- upgrade to Xcode 12
- upgrade to SPM swift tools 5.3
- added support for resources to SPM: now all tests can be launched on all platforms (including acceptance tests)


## [3.2.0](https://github.com/chicio/ID3TagEditor/releases/tag/3.2.0)
Release date: 2020-03-19

#### Added
- removed frames with wrong implementation
- renamed unofficial tags supported only to iTunes
- fixed linux build


## [3.1.0](https://github.com/chicio/ID3TagEditor/releases/tag/3.1.0)
Release date: 2020-03-04

#### Added
- 25 new frames added


## [3.0.1](https://github.com/chicio/ID3TagEditor/releases/tag/3.0.1)
Release date: 2019-11-04

#### Fixed
- Optimized memory usage to avoid crashes when reading/writing big files

## [3.0.0](https://github.com/chicio/ID3TagEditor/releases/tag/3.0.0)
Release date: 2019-11-01

#### Added
- Refactor ID3Tag class with new structure to contains a list of frames (breaking api change)
- Add size information to frame
- Add ID3 tag standard identifier to frame

#### Fixed
- Update to Swift 5.0


## [2.2.0](https://github.com/chicio/ID3TagEditor/releases/tag/2.2.0)
Release date: 2018-12-22

#### Added
- Added support for Swift Package Manager using `swift build`/`swift test` on Linux (Ubuntu) and macOS

#### Fixed
- Update to Swift 4.2
- Changed deprecated `Range` init for conversion to `CountableRange` 
- Fixed Package.swift for Swift Package Manager on macOS
- Fixed frame size encoding for version v4: now is encoded as a synchsafe integer


## [2.1.0](https://github.com/chicio/ID3TagEditor/releases/tag/2.1.0)
Release date: 2018-08-14

#### Added
- New read api that accept mp3 as `Data`  as parameter
- New write api that accept mp3 as `Data`  as parameter

#### Fixed
- Fix crashes on incomplete mp3 file. Now a `CorruptedFile` expection is thrown


## [2.0.0](https://github.com/chicio/ID3TagEditor/releases/tag/2.0.0)
Release date: 2018-08-05

#### Added
- Renamed `art` property as `picture` on the `ID3Tag` class 
- Added v2.4 tag support
    - 2.4 tag and frame configuration (without reverse header support for tag
    - added "TDRC" instead of deprecated "TYER"(2.3)/"TYE"(2.2): field with timestamp that has a fallback to string content
    - new `RecordingDateTime` inside the `ID3Tag` class
- Added "TDAT" frame support
- Added "TIME" frame support

#### Fixed
- Refactoring `ID3TagEditor` class
- Refactoring `ID3FrameContentParsingOperationFactory` class


## [1.2.0](https://github.com/chicio/ID3TagEditor/releases/tag/1.2.0)
Release date: 2018-05-02.

#### Added
- `albumArtist` field to support TEP2 frame.


## [1.1.1](https://github.com/chicio/ID3TagEditor/releases/tag/1.1.1)
Release date: 2018-04-29.

#### Added
- `Genre`, `AttachedPicture` and `TrackPositionInSet` implement `Equatable` protocol.

#### Fixed
- Fixed encoding for 'text information' frames: now strings in this frame are encoding using utf16 string (with BOM).

  
## [1.0.0](https://github.com/chicio/ID3TagEditor/releases/tag/1.0.0)
Release date: 2018-03-14.

#### Added
- Initial release.
