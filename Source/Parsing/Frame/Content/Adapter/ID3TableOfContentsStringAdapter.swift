//
//  ID3TableOfContentsStringAdapter.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/14/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3TableOfContentsStringAdapter: TableOfContentsStringAdapter {

    func adapt(content: String) -> ID3FrameTableOfContents {
        let contentComponents = content.components(separatedBy: ":")
        let elementID = getElementIDFrom(contentComponents: contentComponents)
        let topLevelFlag = getTopLevelFlagFrom(contentComponents: contentComponents)
        let orderedFlag = getOrderedFlagFrom(contentComponents: contentComponents)
        let entryCount = getEntryCountFrom(contentComponents: contentComponents)
        let childElementIDs = getChildElementIDsFrom(contentComponents: contentComponents)
        return ID3FrameTableOfContents(
          elementID: elementID,
          topLevelFlag: topLevelFlag,
          orderedFlag: orderedFlag,
          entryCount: UInt8(entryCount),
          childElementIDs: childElementIDs.compactMap({ $0 }),
          embeddedSubFrames: [])
        #warning("↑ Why is the entry count an integer, but the table of contents needs an unsigned 8‐bit integer?")
        #warning("↑ Why are the child element IDs optional strings, but the table of contents needs non‐optionals?")
        #warning("↑ Where are the subframes supposed to come from?")
    }

    private func getElementIDFrom(contentComponents: [String]) -> String {
        return contentComponents[0]
    }

    private func getTopLevelFlagFrom(contentComponents: [String]) -> Bool {
        let boolInt = Int(contentComponents[1])
        if boolInt == 1 {
            return true
        } else {
            return false
        }
    }

    private func getOrderedFlagFrom(contentComponents: [String]) -> Bool {
        let boolInt = Int(contentComponents[2])
        if boolInt == 1 {
            return true
        } else {
            return false
        }
    }

    private func getEntryCountFrom(contentComponents: [String]) -> Int {
        return Int(contentComponents[3]) ?? 0
    }

    private func getChildElementIDsFrom(contentComponents: [String]) -> [String?] {
        return [contentComponents[4]]
    }

    private func getSubFramesFrom(contentComponents: [String]) -> [ID3Frame] {
        #warning("No idea how to handle this conversion")
        return contentComponents
    }
}
