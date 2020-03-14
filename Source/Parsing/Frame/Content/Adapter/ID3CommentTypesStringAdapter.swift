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
        let description = getDescriptionFrom(contentComponents: contentComponents)
        let content = getContentFrom(contentComponents: contentComponents)
        return ID3FrameCommentTypes(language: language, description: description, content: content)
    }

    private func getLanguageFrom(contentComponents: [String]) -> ISO_639_2_Codes {
        return contentComponents.first.map({ (ISO_639_2_Codes(rawValue: $0 ) ?? .und)})
        ?? .und
    }


    private func getDescriptionFrom(contentComponents: [String]) -> String? {
        return (contentComponents.count > 1 ? String(contentComponents[1]) : nil) ?? ""
    }

    private func getContentFrom(contentComponents: [String]) -> String {
        return String(contentComponents.last ?? "")
    }
}
