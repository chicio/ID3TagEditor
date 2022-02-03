//
//  ID3TagReaderContent.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 03.02.22.
//  Copyright © 2022 Fabrizio Duroni. All rights reserved.
//

import Foundation

struct Genre: Equatable {
    public let identifier: ID3Genre?
    public let description: String?
}

struct PartOfTotal: Equatable {
    public let position: Int
    public let total: Int? 
}
