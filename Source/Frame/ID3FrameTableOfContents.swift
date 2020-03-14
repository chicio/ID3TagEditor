//
//  ID3FrameTableOfContents.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/14/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

/**
 A class used to represent an ID3 table of contents frame.
 
 The purpose of “CTOC” frames is to allow a table of contents to be defined. In the simplest case, a single “CTOC” frame can be used to provide a flat (single-level) table of contents. However, multiple “CTOC” frames can also be used to define a hierarchical (multi-level) table of contents.

 There may be more than one frame of this type in a tag but each must have an Element ID that is unique with respect to any other “CTOC” or “CHAP” frame in the tag.

 Each “CTOC” frame represents one level or element of a table of contents by providing a list of Child Element IDs. These match the Element IDs of other “CHAP” and “CTOC” frames in the tag.
 
 Documentation quoted from: https://mutagen-specs.readthedocs.io/en/latest/id3/id3v2-chapters-1.0.html
 */
public class ID3FrameTableOfContents: ID3Frame, Equatable, CustomDebugStringConvertible {
    
    /** A null-terminated string with a unique ID. The Element ID uniquely identifies the frame. It is not intended to be human readable and should not be presented to the end-user. */
    public var elementID: String

    /** Flag a - Top-level bit
    This is set to 1 to identify the top-level “CTOC” frame. This frame is the root of the Table of Contents tree and is not a child of any other “CTOC” frame. Only one “CTOC” frame in an ID3v2 tag can have this bit set to 1. In all other “CTOC” frames this bit shall be set to 0.*/
    public var topLevelFlag: Bool

    /** Flag b - Ordered bit
     This should be set to 1 if the entries in the Child Element ID list are ordered or set to 0 if they not are ordered. This provides a hint as to whether the elements should be played as a continuous ordered sequence or played individually.
    Note: The Bool flags are documented as being paired in a 2-byte unit: https://mutagen-specs.readthedocs.io/en/latest/_images/CTOCFrame-1.0.png ` */
    public var orderedFlag: Bool

    /**The Entry count is the number of entries in the Child Element ID list that follows and must be greater than zero. Each entry in the list consists of the ElementID of any "child" CTOC or CHAP frames.*/
    public var entryCount: UInt8
    
    /** the list of all child CTOC and/or CHAP frames,
     each entry is null-terminated */
    public var childElementIDs: [String]
    
    /** A sequence of optional frames that are embedded within the “CTOC” frame and which describe this element of the table of contents (e.g. a “TIT2” frame representing the name of the element) or provide related material such as URLs and images. These sub-frames are contained within the bounds of the “CTOC” frame as signalled by the size field in the “CTOC” frame header.*/
    public var embeddedSubFrames: [ID3Frame?]
    
    
    /// ID3FrameTableOfContents description, useful for debug.
    public var debugDescription: String {
        return "\(String(describing: elementID)) - \(String(describing: topLevelFlag)) - \(String(describing: orderedFlag)) - \(String(describing: entryCount)) - \(String(describing: childElementIDs)) - \(String(describing: embeddedSubFrames)))"
    }
    
    /**
     Init a ID3 Table of Contents frame.

     - parameter elementID: the elementID of the frame. Null terminated.
     - parameter topLevelFlag: boolean indicating if this CTOC frame has any children (or parent) CTOC frame(s)
     - parameter orderedFlag: boolean indicating whether any child elementIDs are ordered or not
     - parameter entryCount: the number of child ElementIDs.
     - parameter childElementID: the array of child elementIDs. Must not be empty. Each entry is null terminated.
     - parameter embeddedSubFrames: the (optional) frames containing title and descriptor text for the CTOC frame.

     */
    public init(elementID: String, topLevelFlag: Bool, orderedFlag: Bool, entryCount: UInt8, childElementIDs: [String], embeddedSubFrames: [ID3Frame]) {
        self.elementID = elementID
        self.topLevelFlag = topLevelFlag
        self.orderedFlag = orderedFlag
        self.entryCount = entryCount
        self.childElementIDs = childElementIDs
        self.embeddedSubFrames = embeddedSubFrames
    }

    /**
     Compare two Comment or Language frames.

     - parameter lhs: left side of compare operation.
     - parameter rhs: right side of compare operation.

     - returns: true if the language and content description values are the same, else false.
     */
    public static func ==(lhs: ID3FrameTableOfContents, rhs: ID3FrameTableOfContents) -> Bool {
        return lhs.elementID == rhs.elementID
    }
}
