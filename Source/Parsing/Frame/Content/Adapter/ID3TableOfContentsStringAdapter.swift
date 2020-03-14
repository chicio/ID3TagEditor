//
//  ID3TableOfContentsStringAdapter.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/14/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3TableOfContentsStringAdapter: TableOfContentsStringAdapter {
     
    func adapt(content: String) -> ID3FrameCommentTypes {
        let contentComponents = content.components(separatedBy: ":")
        let elementID = getElementIDFrom(contentComponents: contentComponents)
        let topLevelFlag = getTopLevelFlagFrom(contentComponents: contentComponents)
        let orderedFlag = getOrderedFlagFrom(contentComponents: contentComponents)
        let entryCount = getEntryCountFrom(contentComponents: contentComponents)
        let childElementIDs = getChildElementIDsFrom(contentComponents: contentComponents)
        return ID3FrameCommentTypes(language: language, description: description, content: content)
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
