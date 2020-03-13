//
//  ID3CommentTypesStringAdapter.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/10/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3CommentTypesStringAdapter: CommentTypesStringAdapter {
     
    func adapt(content: String) -> ID3FrameCommentTypes {
        let contentComponents = content.components(separatedBy: ":")
        let language = getLanguageFrom(contentComponents: contentComponents)
        let description = getCommentDescriptionFrom(contentComponents: contentComponents)
        let content = getCommentContentFrom(contentComponents: contentComponents)
        return ID3FrameCommentTypes(language: ISO_639_2_Codes, description: description, content: content)
    }

    private func getLanguageFrom(contentComponents: [String]) -> String {
        return String(contentComponents.first ?? "zxx")
    }

    private func getCommentDescriptionFrom(contentComponents: [String]) -> String? {
        return (contentComponents.count > 1 ? String(contentComponents[1]) : nil) ?? ""
    }

    private func getCommentContentFrom(contentComponents: [String]) -> String {
        return String(contentComponents.last ?? "")
    }

}
