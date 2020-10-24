//
//  TagBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

protocol TagBuilder {
    var frames: [FrameName: ID3Frame] { get set }
    func build() -> ID3Tag
}
