//
//  Mp3FileWriter.swift
//
//  Created by Fabrizio Duroni on 19/07/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class Mp3FileWriter {
    func write(newId3TagData: Data, currentId3TagData: Data?, fromPath: String, toPath: String) throws {
        let validPath = URL(fileURLWithPath: toPath)
        guard validPath.pathExtension.caseInsensitiveCompare("mp3") == ComparisonResult.orderedSame else {
            throw ID3TagEditorError.invalidFileFormat
        }

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
            if #available(iOS 13.0, *) {
                try? readHandle.close()
            } else {
                readHandle.closeFile()
            }
        }

        let writeHandle = try FileHandle(forWritingTo: URL(fileURLWithPath: temporaryPath))
        defer {
            if #available(iOS 13.0, *) {
                try? writeHandle.close()
            } else {
                writeHandle.closeFile()
            }
        }

        // Seek over the tag of the existing file, then copy the rest in chunks
        if #available(iOS 13.4, *) {
            try writeHandle.seekToEnd()
        } else {
            writeHandle.seekToEndOfFile()
        }

        if let currentId3TagData = currentId3TagData {
            if #available(iOS 13.0, *) {
                try readHandle.seek(toOffset: UInt64(currentId3TagData.count))
            } else {
                readHandle.seek(toFileOffset: UInt64(currentId3TagData.count))
            }
        }
        
        var isFinished = false
        while !isFinished {
            try autoreleasepool {
                let chunk = try {
                    if #available(iOS 13.4, *) {
                        return try readHandle.read(upToCount: 131072) // 128 KB
                    } else {
                        return readHandle.readData(ofLength: 131072) // 128 KB
                    }
                }()

                if let chunk, !chunk.isEmpty {
                    if #available(iOS 13.4, *) {
                        try writeHandle.write(contentsOf: chunk)
                    } else {
                        writeHandle.write(chunk)
                    }
                } else {
                    isFinished = true
                }
            }
        }
        
        // Replace the file
        if temporaryPath != toPath {
            _ = try FileManager.default.replaceItemAt(validPath, withItemAt: URL(fileURLWithPath: temporaryPath))
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
