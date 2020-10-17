//
//  ViewController.swift
//  Demo macOS
//
//  Created by Fabrizio Duroni on 27/02/2018.
//  2018 Fabrizio Duroni
//

import Cocoa
import ID3TagEditor

class ViewController: NSViewController {
    private let id3TagEditor = ID3TagEditor()
    @IBOutlet weak var attachedPictureImage: NSImageView!
    @IBOutlet weak var informations: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let mp3 = try Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example", fileType: "mp3")))
            let id3Tag = try id3TagEditor.read(mp3: mp3)!
            if let frameAttachedPicture = id3Tag.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture {
                attachedPictureImage.image = NSImage(data: frameAttachedPicture.picture)
            }
            informations.stringValue = """
                    \((id3Tag.frames[.title] as?  ID3FrameWithStringContent)?.content ?? "")
                    \((id3Tag.frames[.artist] as?  ID3FrameWithStringContent)?.content ?? "")
                """
            print((id3Tag.frames[.title] as?  ID3FrameWithStringContent)?.id3Identifier ?? "")
            print((id3Tag.frames[.title] as?  ID3FrameWithStringContent)?.content ?? "")
            print((id3Tag.frames[.artist] as? ID3FrameWithStringContent)?.content ?? "")
            print((id3Tag.frames[.album] as? ID3FrameWithStringContent)?.content ?? "")
            print((id3Tag.frames[.recordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.year ?? "")
            print((id3Tag.frames[.genre] as? ID3FrameGenre)?.identifier ?? "")
            print((id3Tag.frames[.genre] as? ID3FrameGenre)?.description ?? "")
            print((id3Tag.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.type ?? 0x00)
        } catch {
            print(error)
        }
    }

    override var representedObject: Any? {
        didSet {}
    }
}
