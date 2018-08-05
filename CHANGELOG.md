# Change Log
All changes to ID3TagEditor will be documented in this file.

## [2.0.0](https://github.com/chicio/ID3TagEditor/releases/tag/2.0.0)
Release date: ----

#### Added
- Renamed `art` property as `picture` on the `ID3Tag` class 
- Added v2.4 tag support
    - 2.4 tag and frame configuration (without reverse header support for tag)
    - added "TDRC" instead of deprecated "TYER"(2.3)/"TYE"(2.2): field with timestamp that has a fallback to string content.
    - new `RecordingDateTime` inside the `ID3Tag` class

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
