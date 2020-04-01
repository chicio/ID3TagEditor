//
//  ID3BooleanStringAdapter.swift
//
//  Created by Nolaine Crusher on 04/01/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3BooleanStringAdapter: BooleanStringAdapter {
    func adapt(boolString: String) -> ID3FrameWithBooleanContent {
        return ID3FrameWithBooleanContent(value: getBooleanFromString(boolString: boolString))
    }
    
    private func getBooleanFromString(boolString: String) -> Bool {
        switch boolString.lowercased() {
            case "true", "t", "yes", "y", "1":
                return true
            case "false", "f", "no", "n", "0":
                return false
            default:
                return false
        }
    }
}
