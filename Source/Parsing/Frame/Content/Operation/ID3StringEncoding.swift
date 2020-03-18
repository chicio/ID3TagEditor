//
//  ID3StringEncoding.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 27/04/18.
//

import Foundation

enum ID3StringEncoding: UInt8 {
    case ISO88591 = 0x00
    #warning("This differs from the specification.")
    case UTF16 = 0x01
    case UTF8 = 0x03

    var standardLibraryEncoding: String.Encoding {
      switch self {
      case .ISO88591:
        return .isoLatin1
      case .UTF16:
        return .utf16BigEndian
      case .UTF8:
        return .utf8
      }
    }
}
