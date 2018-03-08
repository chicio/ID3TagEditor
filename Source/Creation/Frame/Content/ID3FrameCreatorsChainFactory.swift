//
//  ID3FrameCreatorsChainFactory.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3FrameCreatorsChainFactory {
    static func make() -> ID3FrameCreatorsChain {
        let frameConfiguration = ID3FrameConfiguration()
        let uInt32ToByteArrayAdapter = UInt32ToByteArrayAdapterUsingUnsafePointer()
        let frameContentSizeCalculator = ID3FrameContentSizeCalculator(
                uInt32ToByteArrayAdapter: uInt32ToByteArrayAdapter
        )
        let frameFlagsCreator = ID3FrameFlagsCreator()
        let frameFromStringContentCreator = ID3FrameFromStringContentCreator(
                frameContentSizeCalculator: frameContentSizeCalculator,
                frameFlagsCreator: frameFlagsCreator,
                paddingAdder: PaddingAdderUsingNullChar()
        )
        let albumFrameCreator = ID3AlbumFrameCreator(
                frameCreator: frameFromStringContentCreator,
                id3FrameConfiguration: frameConfiguration
        )
        let artistFrameCreator = ID3ArtistFrameCreator(
                frameCreator: frameFromStringContentCreator,
                id3FrameConfiguration: frameConfiguration
        )
        let titleFrameCreator = ID3TitleFrameCreator(
                frameCreator: frameFromStringContentCreator,
                id3FrameConfiguration: frameConfiguration
        )
        let attachedPictureFrameCreator = ID3AttachedPictureFramesCreator(
                id3FrameConfiguration: frameConfiguration,
                id3AttachedPictureFrameConfiguration: ID3AttachedPictureFrameConfiguration(),
                frameContentSizeCalculator: frameContentSizeCalculator,
                frameFlagsCreator: frameFlagsCreator
        )
        let yearFrameCreator = ID3YearFrameCreator(
                frameCreator: frameFromStringContentCreator,
                id3FrameConfiguration: frameConfiguration
        )
        let genreFrameCreator = ID3GenreFrameCreator (
                frameCreator: frameFromStringContentCreator,
                id3FrameConfiguration: frameConfiguration
        )
        let trackPositionFrameCreator = ID3TrackPositionFrameCreator(
                frameCreator: frameFromStringContentCreator,
                id3FrameConfiguration: frameConfiguration
        )
        albumFrameCreator.nextCreator = artistFrameCreator
        artistFrameCreator.nextCreator = titleFrameCreator
        titleFrameCreator.nextCreator = yearFrameCreator
        yearFrameCreator.nextCreator = genreFrameCreator
        genreFrameCreator.nextCreator = trackPositionFrameCreator
        trackPositionFrameCreator.nextCreator = attachedPictureFrameCreator
        return  albumFrameCreator
    }
}
