# ``ID3TagEditor``

A swift library to read and modify ID3 Tag of any mp3 file. Listed in the implementations section of the official ID3 standard website id3.org.

## Overview

![ID3TagEditor: A swift library to read and modify ID3 Tag of any mp3 file](https://raw.githubusercontent.com/chicio/ID3TagEditor/main/Assets/icon-logo-background.png 
"ID3TagEditor: A swift library to read and modify ID3 Tag of any mp3 file")

`ID3TagEditor` is a framework that let you read and write id3 tag to your mp3 files, listed in the implementations section of the [official ID3 standard website id3.org](http://id3.org/Implementations "id3.org swift").  
It is compatible with the following platforms:

* iOS
* macOS
* watchOS
* tvOS
* Linux 

Below you can find the list of the official ID3 frames supported by ID3TagEditor:

* ``ID3TagEditor/FrameName/title``
* ``ID3TagEditor/FrameName/album``
* ``ID3TagEditor/FrameName/albumArtist`` 
* ``ID3TagEditor/FrameName/artist``
* ``ID3TagEditor/FrameName/composer``
* ``ID3TagEditor/FrameName/conductor``
* ``ID3TagEditor/FrameName/contentGrouping``
* ``ID3TagEditor/FrameName/copyright``
* ``ID3TagEditor/FrameName/encodedBy``
* ``ID3TagEditor/FrameName/encoderSettings``
* ``ID3TagEditor/FrameName/fileOwner``
* ``ID3TagEditor/FrameName/initialKey``
* ``ID3TagEditor/FrameName/lyricist``
* ``ID3TagEditor/FrameName/mixArtist``
* ``ID3TagEditor/FrameName/publisher``
* ``ID3TagEditor/FrameName/subtitle``
* ``ID3TagEditor/FrameName/beatsPerMinute``
* ``ID3TagEditor/FrameName/originalFilename``
* ``ID3TagEditor/FrameName/lengthInMilliseconds``
* ``ID3TagEditor/FrameName/sizeInBytes``
* ``ID3TagEditor/FrameName/genre``
* ``ID3TagEditor/FrameName/discPosition``
* ``ID3TagEditor/FrameName/trackPosition``
* ``ID3TagEditor/FrameName/recordingDayMonth``
* ``ID3TagEditor/FrameName/recordingYear``
* ``ID3TagEditor/FrameName/recordingHourMinute``
* ``ID3TagEditor/FrameName/recordingDateTime``
* ``ID3TagEditor/FrameName/attachedPicture(_:)``
* ``ID3TagEditor/FrameName/unsynchronizedLyrics(_:)``
* ``ID3TagEditor/FrameName/comment(_:)``

In addition, ID3TagEditor supports the following iTunes unofficial frames:

* ``ID3TagEditor/FrameName/iTunesGrouping``
* ``ID3TagEditor/FrameName/iTunesMovementName``
* ``ID3TagEditor/FrameName/iTunesMovementIndex``
* ``ID3TagEditor/FrameName/iTunesMovementCount``
* ``ID3TagEditor/FrameName/iTunesPodcastCategory``
* ``ID3TagEditor/FrameName/iTunesPodcastDescription``
* ``ID3TagEditor/FrameName/iTunesPodcastID``
* ``ID3TagEditor/FrameName/iTunesPodcastKeywords``

All frames are encoded and formatted following the official specification:
* text frames (frames with identifier starting with a capital T) uses UTF-16 to encode text
* frames with ad hoc encoding and/or formatting are supported (for example recordingDateTime must always be a ISO88591 string)
* frames with localized content support all the languages identifier contained in the ISO-639-2  

Refer to the [id3 specification](https://id3.org/Developer%20Information "id3 specification") for additional details.

## Featured

@Links(visualStyle: detailedGrid) {
    - <doc:Installation>
    - <doc:Examples>
}
