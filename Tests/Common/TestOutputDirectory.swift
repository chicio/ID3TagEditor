//
//  TestOutputDirectory.swift
//  ID3TagEditor
//

import Foundation

struct TestOutputDirectory {
    static let path = directory.path
    static let url = directory.url

    // The `directory` variable ensures that createDirectory() is only called once per process.
    private static let directory = createDirectory()

    private static func createDirectory() -> (path: String, url: URL) {
        let homePath = NSHomeDirectory()
        let startTime = Int(Date.now.timeIntervalSince1970)

        let path = homePath + "/ID3TagEditor_testOutput/\(startTime)"
        let url = URL(fileURLWithPath: path, isDirectory: true)

        try! FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)

        return (path: path, url: url)
    }
}
