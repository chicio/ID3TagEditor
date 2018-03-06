//
//  ViewController.swift
//  Demo macOS
//
//  Created by Fabrizio Duroni on 27.02.18.
//  Copyright © 2018 Fabrizio Duroni. All rights reserved.
//

import Cocoa
import ID3TagEditor

class ViewController: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let id3TagEditor = try ID3TagEditor(path: PathLoader().pathFor(name: "example", fileType: "mp3"))
            if let id3Tag = id3TagEditor.read() {
                print(id3Tag.title ?? "")
                print(id3Tag.artist ?? "")
                print(id3Tag.album ?? "")
                print(id3Tag.year ?? "")
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
