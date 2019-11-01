# Change Log
All changes to ID3TagEditor will be documented in this file.

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
    - 2.4 tag and frame configuration (without reverse header support for tag)
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
