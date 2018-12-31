//
//  FrameWithStringContent.swift
//
//  Created by Fabrizio Duroni on 31/12/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class FrameWithStringContent: Frame {
    let content: String
    
    init(content: String) {
        self.content = content
    }
    
    func getContent() -> String {
        return content
    }
}
