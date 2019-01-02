//
//  ID3Frame.swift
//
//  Created by Fabrizio Duroni on 31/12/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

public enum FrameName {
    case Title
    case Album
    case AlbumArtist
    case Artist
    case Genre
    case TrackPosition
    // only v3/2, for v4 use RecordingDateTime
    case RecordingDayMonth
    // only v3/2, for v4 use RecordingDateTime
    case RecordingYear
    // only v3/2, for v4 use RecordingDateTime
    case RecordingHourMinute
    // only v4, for v3/2 use RecordingDayMonth, RecordingYear, RecordingHourMinute
    case RecordingDateTime
    case AttachedPictureOther
    case AttachedPicturefileIcon
    case AttachedPictureOtherFileIcon
    case AttachedPictureFrontCover
    case AttachedPictureBackCover
    case AttachedPictureLeafletPage
    case AttachedPictureMedia
    case AttachedPictureLeadArtistLeadPerformerSoloist
    case AttachedPictureArtistPerformer
    case AttachedPictureConductor
    case AttachedPictureBandOrchestra
    case AttachedPictureComposer
    case AttachedPictureLyricistTextWriter
    case AttachedPictureRecordingLocation
    case AttachedPictureDuringRecording
    case AttachedPictureDuringPerformance
    case AttachedPictureMovieVideoScreenCapture
    case AttachedPictureABrightColouredFish
    case AttachedPictureIllustration
    case AttachedPictureBandArtistLogotype
    case AttachedPicturePublisherStudioLogotype
}
/**.
 A class that contains the basic features of a frame.
 */
public class ID3Frame {
    
}
