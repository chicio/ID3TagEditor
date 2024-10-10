//
//  Mp3FileWriter.swift
//
//  Created by Fabrizio Duroni on 19/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class Mp3FileWriter {
    func write(newId3TagData: Data, currentId3Tag: ID3Tag?, fromPath: String, toPath: String) throws {
        // Create a temporary file for the new mp3
        let temporaryPath = {
            if toPath != fromPath {
                return toPath
            }
            
            return FileManager.default.temporaryDirectory.appendingPathComponent("\(UUID().uuidString).mp3").path
        }()
        
        defer {
            if temporaryPath != toPath {
                try? FileManager.default.removeItem(atPath: temporaryPath)
            }
        }
        
        try eventuallyCreateIntermediatesDirectoriesFor(path: temporaryPath)
        try newId3TagData.write(to: URL(fileURLWithPath: temporaryPath))
        
        // Create file handles
        let readHandle = try FileHandle(forReadingFrom: URL(fileURLWithPath: fromPath))
        defer {
            readHandle.closeFile()
        }
        
        let writeHandle = try FileHandle(forWritingTo: URL(fileURLWithPath: temporaryPath))
        defer {
            writeHandle.closeFile()
        }
        
        // Seek over the tag of the existing file, then copy the rest in chunks
        writeHandle.seekToEndOfFile()
        
        if let validCurrentId3Tag = currentId3Tag {
            let tagSizeWithHeader = UInt64(validCurrentId3Tag.properties.size) + UInt64(ID3TagConfiguration().headerSize())
            readHandle.seek(toFileOffset: tagSizeWithHeader)
        } else {
            readHandle.seek(toFileOffset: 0)
        }
        
        var isFinished = false
        while !isFinished {
            autoreleasepool {
                let chunk = readHandle.readData(ofLength: 65536) // 64 KB
                writeHandle.write(chunk)
                isFinished = chunk.isEmpty
            }
        }
        
        // Replace the file
        if temporaryPath != toPath {
            _ = try FileManager.default.replaceItemAt(URL(fileURLWithPath: toPath), withItemAt: URL(fileURLWithPath: temporaryPath))
        }
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
