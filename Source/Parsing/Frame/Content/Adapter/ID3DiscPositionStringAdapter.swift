//
//  ID3DiscPositionStringAdapter.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//
// altered by Nolaine Crusher

import Foundation

class ID3DiscPositionStringAdapter: DiscPositionStringAdapter {
    func adapt(discPosition: String) -> ID3FrameDiscPosition {
        let discPositionComponents = discPosition.components(separatedBy: "/")
        let discPosition = getDiscPositionFrom(discPositionComponents: discPositionComponents)
        let totalDiscs = getTotalDiscsFrom(discPositionComponents: discPositionComponents)
        return ID3FrameDiscPosition(position: discPosition, totalDiscs: totalDiscs)
    }

    private func getDiscPositionFrom(discPositionComponents: [String]) -> Int {
        return Int(discPositionComponents[0]) ?? 0
    }

    private func getTotalDiscsFrom(discPositionComponents: [String]) -> Int? {
        return discPositionComponents.count > 1 ? Int(discPositionComponents[1]) : nil
    }
}
