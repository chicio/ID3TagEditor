//
//  ID3CoupleOfNumbersAdapter.swift
//
//  Created by Fabrizio Duroni on 05/08/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

typealias CoupleOfNumbers = (Int?, Int?)

class ID3CoupleOfNumbersAdapter {
    func adapt(coupleOfNumbers: String) -> CoupleOfNumbers {
        let day = Int(coupleOfNumbers.prefix(coupleOfNumbers.count / 2))
        let month = Int(coupleOfNumbers.suffix(coupleOfNumbers.count / 2))
        return (day, month)
    }
}
