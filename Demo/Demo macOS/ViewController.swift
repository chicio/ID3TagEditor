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
            let id3TagEditor = try ID3TagEditor(path: pathFor(name: "example", fileType: "mp3"))
            print("title: " + (id3TagEditor.getTitle() ?? ""))
            print("artist: " + (id3TagEditor.getArtist() ?? ""))
            print("album: " + (id3TagEditor.getAlbum() ?? ""))
        } catch {
            print(error)
        }
    }
    
    private func pathFor(name: String, fileType: String) -> String {
        let bundle = Bundle(for: type(of: self));
        let path = bundle.path(forResource: name, ofType: fileType)!;
        return path;
    }

    override var representedObject: Any? {
        didSet {}
    }
}
