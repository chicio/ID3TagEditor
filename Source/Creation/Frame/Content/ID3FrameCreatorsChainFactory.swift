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
        let frameContentSizeCalculator = ID3FrameContentSizeCalculator(uInt32ToByteArrayAdapter: uInt32ToByteArrayAdapter)
        let frameFlagsCreator = ID3FrameFlagsCreator()
        let frameFromStringContentCreator = ID3FrameFromStringContentCreator(
                frameContentSizeCalculator: frameContentSizeCalculator,
                frameFlagsCreator: frameFlagsCreator,
                paddingAdder: PaddingAdderUsingNullChar())
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
        let artworkFrameCreator = ID3ArtworkFrameCreator(
                id3FrameConfiguration: frameConfiguration,
                frameContentSizeCalculator: frameContentSizeCalculator,
                frameFlagsCreator: frameFlagsCreator
        )
        albumFrameCreator.nextCreator = artistFrameCreator
        artistFrameCreator.nextCreator = titleFrameCreator
        titleFrameCreator.nextCreator = artworkFrameCreator
        return  albumFrameCreator
    }
}
