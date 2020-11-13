//
//  UInt32ToByteArrayAdapter.swift
//
//  Created by Fabrizio Duroni on 19/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol UInt32ToByteArrayAdapter {
    func adapt(uInt32: UInt32) -> [UInt8]
}
