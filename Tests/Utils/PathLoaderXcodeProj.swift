//
//  PathLoaderXcodeProj.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 25/09/2020.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import Foundation

/**
 This file has the same name as the one contained in PathLoader.swift.
 This duplication is need in order to be able to open the project as Swift SPM package and as Xcode standard project.
*/
class PathLoader {
    func pathFor(name: String, fileType: String) -> String {
        let bundle = Bundle(for: type(of: self));
        let path = bundle.path(forResource: name, ofType: fileType)!;
        return path;
    }
}
