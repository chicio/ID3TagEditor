//
//  ID32TagCommonCompositeFramesBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

public class ID32TagCommonCompositeFramesBuilder: ID32TagCommonStringFramesBuilder {
    public func genre(frame: ID3FrameGenre) -> Self {
        frames[.genre] = frame
        return self
    }

    public func discPosition(frame: ID3FramePartOfTotal) -> Self {
        frames[.discPosition] = frame
        return self
    }

    public func trackPosition(frame: ID3FramePartOfTotal) -> Self {
        frames[.trackPosition] = frame
        return self
    }

    public func attachedPicture(pictureType: ID3PictureType, frame: ID3FrameAttachedPicture) -> Self {
        frames[.attachedPicture(pictureType)] = frame
        return self
    }

    public func unsynchronisedLyrics(language: ID3FrameContentLanguage,
                                     frame: ID3FrameUnsynchronisedLyrics) -> Self {
        frames[.unsynchronizedLyrics(language)] = frame
        return self
    }
}
