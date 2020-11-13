//
//  ID3TrackPositionStringAdapter.swift
//
//  Created by Fabrizio Duroni on 08/03/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3PartOfTotalStringAdapter: PartOfTotalStringAdapter {
    func adapt(partOfTotal: String) -> ID3FramePartOfTotal {
        let partOfTotalComponents = partOfTotal.components(separatedBy: "/")
        let partOfTotal = getPartOfTotalFrom(partOfTotalComponents: partOfTotalComponents)
        let totalParts = getTotalPartsFrom(partOfTotalComponents: partOfTotalComponents)
        return ID3FramePartOfTotal(part: partOfTotal, total: totalParts)
    }

    private func getPartOfTotalFrom(partOfTotalComponents: [String]) -> Int {
        return Int(partOfTotalComponents[0]) ?? 0
    }

    private func getTotalPartsFrom(partOfTotalComponents: [String]) -> Int? {
        return partOfTotalComponents.count > 1 ? Int(partOfTotalComponents[1]) : nil
    }
}
