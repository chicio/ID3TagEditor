# Examples

Let's see how you can use `ID3TagEditor` to read and write ID3 tags.

#### Read

To read the ID3 tag of an mp3 file you can choose between two API contained in the ``ID3TagEditor`` class:
* ``ID3TagEditor/ID3TagEditor/read(from:)``
* ``ID3TagEditor/ID3TagEditor/read(mp3:)``

After getting a ``ID3Tag`` from one of the read API above, you have two options to read the content:


* if you're interested in reading just the content of the frames, you can create an instance of ``ID3TagContentReader`` by passing to it the ``ID3Tag`` received from the read API and then access the frames content by using its methods.

```swift
do {
    if let id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example", fileType: "mp3")) {
        let tagContentReader = ID3TagContentReader(id3Tag: id3Tag)
        print(tagContentReader.title() ?? "")
        print(tagContentReader.artist() ?? "")
        // ...read other stuff...
    }
} catch  {
    print(error)
}  
```

* if you need full frames data, you can access to the ``ID3TagEditor/ID3Tag/frames`` property.
 In this way you will have access to all the data contained in them, including their content and its features like the size and the ID3 frame identifier.

```swift
do {
    let id3TagEditor = ID3TagEditor()

    if let id3Tag = try id3TagEditor.read(from: "<valid path to the mp3 file>") {
        // ...use the tag...
        // For example to read the title, album and artist content you can do something similar
        print((id3Tag.frames[.title] as?  ID3FrameWithStringContent)?.content ?? "")
        print((id3Tag.frames[.artist] as? ID3FrameWithStringContent)?.content ?? "")
        print((id3Tag.frames[.album] as? ID3FrameWithStringContent)?.content ?? "")
    }
    
    if let id3Tag = try id3TagEditor.read(mp3: "<valid mp3 file passed as Data>") {
        // ...use the tag...
        // For example to read the title, album and artist content you can do something similar
        print((id3Tag.frames[.title] as?  ID3FrameWithStringContent)?.content ?? "")
        print((id3Tag.frames[.artist] as? ID3FrameWithStringContent)?.content ?? "")
        print((id3Tag.frames[.album] as? ID3FrameWithStringContent)?.content ?? "")
    }    
} catch {
    print(error)
}  
```

 #### Write

To write a new ID3 tag into an mp3 file you can choose between two API contained in the ``ID3TagEditor`` class:

* ``ID3TagEditor/ID3TagEditor/write(tag:mp3:)``
* ``ID3TagEditor/ID3TagEditor/write(tag:to:andSaveTo:)``

The only way to create a valid ``ID3Tag`` is by using of the tag builder available:

* ``ID32v2TagBuilder``, a builder useful to create ID3 tag version 2.2
* ``ID32v3TagBuilder``, a builder useful to create ID3 tag version 2.3
* ``ID32v4TagBuilder``, a builder useful to create ID3 tag version 2.4

You can't create an instance of ``ID3Tag``  without one of the builders above.
Below you can find a sample code that will write an ID3 tag version 3 with all the frames supported by ``ID3TagEditor`` to an mp3 file.

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
        .recordingYear(frame: ID3FrameWithIntegerContent(year: 2020))
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
        .comment(language: .ita, frame: ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.ita, contentDescription: "CD", content: "v2 ita comment"))
        .comment(language: .eng, frame: ID3FrameWithLocalizedContent(language: ID3FrameContentLanguage.eng, contentDescription: "CD", content: "v2 eng comment"))
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

You can also find more usage example in the [read/write acceptance test](https://github.com/chicio/ID3TagEditor/blob/main/Tests/Acceptance/ID3TagEditorWriteReadAcceptanceTest.swift "example acceptance tests") included in the project.
