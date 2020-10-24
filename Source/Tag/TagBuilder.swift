//
//  TagBuilder.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 24.10.20.
//  2020 Fabrizio Duroni.
//

import Foundation

public protocol TagBuilder: AnyObject {
    func build() -> ID3Tag
}
