//
//  BooleanStringAdapter.swift
//
//  Created by Nolaine Crusher on 04/01/2020
//  2018 Fabrizio Duroni.
//

import Foundation

protocol BooleanStringAdapter {
    func adapt(boolString: String) -> ID3FrameWithBooleanContent
}
