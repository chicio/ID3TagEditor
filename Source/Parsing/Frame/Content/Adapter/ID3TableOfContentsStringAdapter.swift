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
          entryCount: entryCount,
          childElementIDs: childElementIDs,
          embeddedSubFrames: getSubFramesFrom(contentComponents: contentComponents))
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

    private func getEntryCountFrom(contentComponents: [String]) -> UInt8 {
        #warning("Is falling back to zero really the right thing to do?")
        #warning("Can 3 be out of bounds? Is trapping in this case okay?")
        return UInt8(contentComponents[3]) ?? 0
    }

    private func getChildElementIDsFrom(contentComponents: [String]) -> [String] {
        #warning("Can 4 be out of bounds? Is trapping in this case okay?")
        #warning("Why are we wrapping a single string in an array?")
        return [contentComponents[4]]
    }

    private func getSubFramesFrom(contentComponents: [String]) -> [ID3Frame] {
         #warning("What is this supposed to do?")
        return []
    }
}
