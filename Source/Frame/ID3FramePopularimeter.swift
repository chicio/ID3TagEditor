//
//  ID3FramePopularimeter.swift
//  mplayer
//
//  Created by Alex on 11 Jul 19.
//  Copyright © 2019 Aleksey Lebedev. All rights reserved.
//

import Foundation

public class ID3FramePopularimeter: ID3Frame, CustomDebugStringConvertible {

    public let email: String
    public let rating: Int
    public let counter: Int

    public var debugDescription: String {
        return "\(email) \(rating) \(counter)"
    }

    public init(email: String, rating: Int, counter: Int) {
        self.email = email
        self.rating = rating
        self.counter = counter
    }
}
