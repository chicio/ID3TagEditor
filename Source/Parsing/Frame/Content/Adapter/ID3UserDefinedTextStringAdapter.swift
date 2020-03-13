//
//  ID3UserDefinedTextStringAdapter.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/13/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3UserDefinedTextStringAdapter: UserDefinedTextStringAdapter {
     
    func adapt(content: String) -> ID3FrameUserDefinedText {
        let contentComponents = content.components(separatedBy: ":")
        let description = getDescriptionFrom(contentComponents: contentComponents)
        let content = getContentFrom(contentComponents: contentComponents)
        return ID3FrameUserDefinedText(description: description, content: content)
    }

    private func getDescriptionFrom(contentComponents: [String]) -> String? {
        return (contentComponents.count > 1 ? String(contentComponents[1]) : nil) ?? ""
    }

    private func getContentFrom(contentComponents: [String]) -> String {
        return String(contentComponents.last ?? "")
    }

}
