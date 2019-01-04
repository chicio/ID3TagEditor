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
            let mp3 = try! Data(contentsOf: URL(fileURLWithPath: PathLoader().pathFor(name: "example", fileType: "mp3")))
            if let id3Tag = try id3TagEditor.read(mp3: mp3) {
                if let attachedPictures = id3Tag.attachedPictures, attachedPictures.count > 0 {
                    attachedPictureImage.image = NSImage(data: attachedPictures[0].picture)
                }
                informations.stringValue = """
                    \((id3Tag.frames[.Title] as?  ID3FrameWithStringContent)?.content ?? "")
                    \((id3Tag.frames[.Artist] as?  ID3FrameWithStringContent)?.content ?? "")
                """
                print((id3Tag.frames[.Title] as?  ID3FrameWithStringContent)?.content ?? "")
                print((id3Tag.frames[.Artist] as? ID3FrameWithStringContent)?.content ?? "")
                print((id3Tag.frames[.Album] as? ID3FrameWithStringContent)?.content ?? "")
                print(id3Tag.recordingDateTime?.date?.year ?? "")
                print(id3Tag.genre?.identifier ?? "")
                print(id3Tag.genre?.description ?? "")
                print(id3Tag.attachedPictures?[0].type ?? 0x00)
            }
        } catch {
            print(error)
        }
    }
    
    override var representedObject: Any? {
        didSet {}
    }
}
