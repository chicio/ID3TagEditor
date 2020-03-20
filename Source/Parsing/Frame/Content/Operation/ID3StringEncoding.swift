//
//  ID3StringEncoding.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 27/04/18.
//

import Foundation

enum ID3StringEncoding: UInt8 {
    case isoLatin1 = 0x00
    case utf16WithBOM = 0x01
    case utf16BigEndian = 0x02
    case utf8 = 0x03

    func exists(in version: ID3Version) -> Bool {
      switch self {
      case .utf16WithBOM, .isoLatin1:
        return true
      case .utf8, .utf16BigEndian:
        switch version {
        case .version2, .version3:
          return false
        case .version4:
          return true
        }
      }
    }

    var standardLibraryEncoding: String.Encoding {
      switch self {
      case .isoLatin1:
        return .isoLatin1
      case .utf16WithBOM:
        return .utf16
      case .utf8:
        return .utf8
      case .utf16BigEndian:
        return .utf16BigEndian
      }
    }
}
