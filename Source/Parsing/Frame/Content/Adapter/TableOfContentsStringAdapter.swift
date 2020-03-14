//
//  TableOfContentsStringAdapter.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/14/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

protocol TableOfContentsStringAdapter {
    func adapt(content: String) -> ID3FrameTableOfContents
}
