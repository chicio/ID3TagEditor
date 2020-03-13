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
        let commentLanguage = getLanguageFrom(contentComponents: contentComponents)
        let commentDescription = getCommentDescriptionFrom(contentComponents: contentComponents)
        let commentContent = getCommentContentFrom(contentComponents: contentComponents)
        return ID3FrameCommentTypes(language: ISO_639_2_Codes(rawValue: commentLanguage) ?? .zxx, contentDescription: commentDescription, contentText: commentContent)
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
