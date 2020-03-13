//
//  StringExtension.swift
//  ID3TagEditor
//
//  Created by Nolaine Crusher on 3/13/20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

extension String {
    var nullTerminated: Data? {
        if var data = self.data(using: String.Encoding.utf8) {
            data.append(0)
            return data
        }
        return nil
    }
}
