//
//  StringToBytesAdapter.swift
//
//  Created by Fabrizio Duroni on 27/04/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol StringToBytesAdapter {
    func encoding(for version: ID3Version) -> [UInt8]
    func adapt(stringOnly string: String) -> [UInt8]
    func termination() -> [UInt8]
}

extension StringToBytesAdapter {

  internal func adapt(
    string: String,
    for version: ID3Version,
    includingEncoding: Bool = true,
    includingTermination: Bool = true
  ) -> [UInt8] {
    var data = adapt(stringOnly: string)
    if includingEncoding {
      data.insert(contentsOf: encoding(for: version), at: data.startIndex)
    }
    if includingTermination {
      data.append(contentsOf: termination())
    }
    return data
  }
}
