//
//  PathLoader.swift
//
//  Created by Fabrizio Duroni on 20/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class PathLoader {

    static let packageRoot: URL = {
      // Will need to switch to “#filePath” after SE‐0274:
      // https://github.com/apple/swift-evolution/blob/master/proposals/0274-magic-file.md
      let thisFile = URL(fileURLWithPath: #file)
      return thisFile
        .deletingLastPathComponent()
        .deletingLastPathComponent()
        .deletingLastPathComponent()
    }()

    func pathFor(name: String, fileType: String) -> String {
        #if SWIFT_PACKAGE
        let examples = PathLoader.packageRoot
          .appendingPathComponent("Tests")
          .appendingPathComponent("Examples")
        let url = examples
          .appendingPathComponent(name)
          .appendingPathExtension(fileType)
        let path = url.path
        #else
        let bundle = Bundle(for: type(of: self));
        let path = bundle.path(forResource: name, ofType: fileType)!;
        #endif
        return path;
    }

    static let testOutputDirectory: URL = {
      return packageRoot
        .appendingPathComponent("Tests")
        .appendingPathComponent("Output")
    }()
}
