import Foundation
import ID3TagEditor

print("Start...")

let mp3Path = FileManager.default.currentDirectoryPath + "/Sources/Demo Ubuntu/example-v3-additional-data.mp3"

do {
    let id3TagEditor = ID3TagEditor()
    if let id3Tag = try id3TagEditor.read(mp3: Data(contentsOf: URL(fileURLWithPath: mp3Path))) {
        print("Title: \((id3Tag.frames[.Title] as? ID3FrameWithStringContent)?.content ?? "")")
        print("Artist: \((id3Tag.frames[.Artist] as? ID3FrameWithStringContent)?.content ?? "")")
        print("Album: \((id3Tag.frames[.Album] as? ID3FrameWithStringContent)?.content ?? "")")
        print("Album Artist: \((id3Tag.frames[.AlbumArtist] as? ID3FrameWithStringContent)?.content ?? "")")
    }
} catch {
   print(error)
}

print("Finish!!")
