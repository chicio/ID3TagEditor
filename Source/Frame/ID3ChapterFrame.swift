//
//  ID3ChapterFrame.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/14/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

/**
 A class used to represent an ID3 chapter frame.
 */
public class ID3ChapterFrame: ID3Frame, Equatable, CustomDebugStringConvertible {
    
    /** The Element ID uniquely identifies the frame. It is not intended to be human readable and should not be presented to the end user. Null terminated */
    public var elementID: String

    /** The Start and End times are a count in milliseconds from the beginning of the file to the start and end of the chapter respectively. */
    public var startTime: Int
    public var endTime: Int
    
    /** The Start offset is a zero-based count of bytes from the beginning of the file to the first byte of the first audio frame in the chapter. If these bytes are all set to 0xFF then the value should be ignored and the start time value should be utilized.*/
    public var startByteOffset: Int
    
    /** The End offset is a zero-based count of bytes from the beginning of the file to the first byte of the audio frame following the end of the chapter. If these bytes are all set to 0xFF then the value should be ignored and the end time value should be utilized.*/
    public var endByteOffset: Int

    /** A sequence of optional frames that are embedded within the “CHAP” frame and which describe the content of the chapter (e.g. a “TIT2” frame representing the chapter name) or provide related material such as URLs and images. These sub-frames are contained within the bounds of the “CHAP” frame as signalled by the size field in the “CHAP” frame header. If a parser does not recognise “CHAP” frames it can skip them using the size field in the frame header. When it does this it will skip any embedded sub-frames carried within the frame. */
    public var embeddedSubFrames: [ID3Frame?]


    /// ID3FrameCommentLyrics description, useful for debug.
    public var debugDescription: String {
        return "\(String(describing: elementID)) - \(String(describing: startTime)) - \(String(describing: endTime)) - \(String(describing: startByteOffset)) - \(String(describing: endByteOffset)) - \(String(describing: embeddedSubFrames)))"
    }
    
    /**
     Init a ID3 Chapter frame.

     - parameter elementID: the elementID of the frame. Null terminated.
     - parameter startTime: integer indicating the beginning of the chapter, in milliseconds
     - parameter endTime: integer indicating the end of the chapter, in milliseconds
     - parameter startByteOffset: integer indicating the byte offset for the start of the chapter.
     - parameter endByteOffset: integer indicating the byte offset for the end of the chapter
     - parameter embeddedSubFrames: the (optional) frames containing title and descriptor text for the CHAP frame. A title is recommended at the least.
     */
    public init(elementID: String, startTime: Int, endTime: Int, startByteOffset: Int, endByteOffset: Int, embeddedSubFrames: [ID3Frame]) {
        self.elementID = elementID
        self.startTime = startTime
        self.endTime = endTime
        self.startByteOffset = startByteOffset
        self.endByteOffset = endByteOffset
        self.embeddedSubFrames = embeddedSubFrames
    }


    /**
     Compare two Comment or Language frames.

     - parameter lhs: left side of compare operation.
     - parameter rhs: right side of compare operation.

     - returns: true if the language and content description values are the same, else false.
     */
    public static func ==(lhs: ID3ChapterFrame, rhs: ID3ChapterFrame) -> Bool {
        return lhs.elementID == rhs.elementID
    }
}
