//
//  Mp3FileWriter.swift
//
//  Created by Fabrizio Duroni on 19/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class Mp3FileWriter {
    func write(mp3: Data, path: String) throws {
        try eventuallyCreateIntermediatesDirectoriesFor(path: path)
        try mp3.write(to: URL(fileURLWithPath: path))
    }

    private func eventuallyCreateIntermediatesDirectoriesFor(path: String) throws {
        let fileUrl = URL(fileURLWithPath: NSString(string: path).deletingLastPathComponent)
        var isDirectory: ObjCBool = false
        if !FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory) ||
            !isDirectory.boolValue {
            try FileManager.default.createDirectory(at: fileUrl, withIntermediateDirectories: true)
        }
    }
}
