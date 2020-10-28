//
//  ID32TagCommonCompositeFramesBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

/**
 This is another base common class of all ID3 Tag builder. ID32v2TagBuilder, ID32v3TagBuilder and
 ID32v4TagBuilder inherits from this class. It let the user set frames with structured
 content (images, multiple numbers etc.) that are in common to all the ID3 v2 tag specificiation.
 This class can't be used in user code. Use of ID32v2TagBuilder, ID32v3TagBuilder and ID32v4TagBuilder classes.
 */
public class ID32TagCommonCompositeFramesBuilder: ID32TagCommonStringFramesBuilder {
    /**
      Set the genre frame to be written by ID3TagEditor.
     
      - parameter frame: the genre frame as a ID3FrameGenre instance.
     
      - returns: the instance of the builder.
     */
    public func genre(frame: ID3FrameGenre) -> Self {
        frames[.genre] = frame
        return self
    }

    /**
      Set the discPosition frame to be written by ID3TagEditor.
     
      - parameter frame: the discPosition frame as a ID3FramePartOfTotal instance.
     
      - returns: the instance of the builder.
     */
    public func discPosition(frame: ID3FramePartOfTotal) -> Self {
        frames[.discPosition] = frame
        return self
    }

    /**
      Set the trackPosition frame to be written by ID3TagEditor.
     
      - parameter frame: the trackPosition frame as a ID3FramePartOfTotal instance.
     
      - returns: the instance of the builder.
     */
    public func trackPosition(frame: ID3FramePartOfTotal) -> Self {
        frames[.trackPosition] = frame
        return self
    }

    /**
     Set an attachedPicture frame to be written by ID3TagEditor. You can set multiple
     attached picture frames per tag, one for each of the picture types contained in ID3PictureType.
     
      - parameter pictureType: the ID3PictureType associated to the attachedPicture frame to be set.
      - parameter frame: the attachedPicture frame as a ID3FrameAttachedPicture instance.
     
      - returns: the instance of the builder.
     */
    public func attachedPicture(pictureType: ID3PictureType, frame: ID3FrameAttachedPicture) -> Self {
        frames[.attachedPicture(pictureType)] = frame
        return self
    }

    /**
     Set an unsynchronisedLyrics frame to be written by ID3TagEditor. You can set multiple
     unsynchronised lyrics frames per tag, one for each of the languages contained in ID3FrameContentLanguage.
     
      - parameter language: the ID3FrameContentLanguage associated to the unsynchronisedLyrics frame to be set.
      - parameter frame: the unsynchronisedLyrics frame as a ID3FrameWithLocalizedContent instance.
     
      - returns: the instance of the builder.
     */
    public func unsynchronisedLyrics(language: ID3FrameContentLanguage,
                                     frame: ID3FrameWithLocalizedContent) -> Self {
        frames[.unsynchronizedLyrics(language)] = frame
        return self
    }

    /**
     Set an comment frame to be written by ID3TagEditor. You can set multiple
     comment frames per tag, one for each of the languages contained in ID3FrameContentLanguage.
     
      - parameter language: the ID3FrameContentLanguage associated to the comment frame to be set.
      - parameter frame: the comment frame as a ID3FrameWithLocalizedContent instance.
     
      - returns: the instance of the builder.
     */
    public func comment(language: ID3FrameContentLanguage,
                        frame: ID3FrameWithLocalizedContent) -> Self {
        frames[.comment(language)] = frame
        return self
    }
}
