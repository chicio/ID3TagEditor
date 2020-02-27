//
//  ID3DiscPositionStringAdapter.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

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
