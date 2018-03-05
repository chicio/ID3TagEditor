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
            print(id3TagEditor.getTitle() ?? "")
            print(id3TagEditor.getArtist() ?? "")
            print(id3TagEditor.getAlbum() ?? "")
            print(id3TagEditor.getYear() ?? "")
            print(id3TagEditor.getGenre()?.genre ?? "")
            print(id3TagEditor.getGenre()?.description ?? "")
        } catch {
            print(error)
        }
    }
    
    override var representedObject: Any? {
        didSet {}
    }
}
