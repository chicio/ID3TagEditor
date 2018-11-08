import Foundation
import ID3TagEditor

print("Start...")

do {
    let id3TagEditor = ID3TagEditor()
    if let id3Tag = try id3TagEditor.read(mp3: Data(contentsOf: URL(fileURLWithPath: "./example-v3-additional-data.mp3"))) {
        print(id3Tag.title ?? "") 
    } 
} catch {
   print(error)
}

print("Finish!!")
