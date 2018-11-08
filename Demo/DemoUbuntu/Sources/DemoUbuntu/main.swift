import Foundation
import ID3TagEditor

print("Start...")

let mp3Path = FileManager.default.currentDirectoryPath + "/Sources/DemoUbuntu/example-v3-additional-data.mp3"

do {
    let id3TagEditor = ID3TagEditor()
    if let id3Tag = try id3TagEditor.read(mp3: Data(contentsOf: URL(fileURLWithPath: mp3Path))) {
        print("Title: \(id3Tag.title ?? "")")
        print("Artist: \(id3Tag.artist ?? "")")
        print("Album: \(id3Tag.album ?? "")")
        print("Album Artist: \(id3Tag.albumArtist ?? "")")
        print("Genre: \(id3Tag.genre?.description ?? "")")
        print("Year: \(id3Tag.recordingDateTime?.date?.year ?? 0)")
    }
} catch {
   print(error)
}

print("Finish!!")
