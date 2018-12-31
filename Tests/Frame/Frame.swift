//
//  Frame.swift
//
//  Created by Fabrizio Duroni on 31/12/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

/**
 A protocol that describes the basic features of a ID3 Frame
 */
public protocol Frame {
    func getContent() -> String
}
