//
//  ViewController.swift
//  Demo iOS
//
//  Created by Fabrizio Duroni on 27.02.18.
//  Copyright © 2018 Fabrizio Duroni. All rights reserved.
//

import UIKit
import ID3TagEditor

class ViewController: UIViewController {
    @IBOutlet weak var artworkImage: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var albumTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func update(_ sender: Any) {
        do {
            let id3TagEditor = try ID3TagEditor(path: pathFor(name: "example", fileType: "mp3"))
            id3TagEditor.setTitle(title: titleTextField.text ?? "")
            id3TagEditor.setAlbum(album: albumTextField.text ?? "")
            id3TagEditor.setArtist(artist: artistTextField.text ?? "")
            try id3TagEditor.write()
        } catch {
            print(error)
        }
    }
    
    @IBAction func load(_ sender: Any) {
        do {
            let id3TagEditor = try ID3TagEditor(path: pathFor(name: "example", fileType: "mp3"))
            titleTextField.text = id3TagEditor.getTitle()
            albumTextField.text = id3TagEditor.getAlbum()
            artistTextField.text = id3TagEditor.getArtist()
            if let artwork = id3TagEditor.getArtwork() {
                artworkImage.image = UIImage(data: artwork)
            }
        } catch {
            print(error)
        }
    }
    
    private func pathFor(name: String, fileType: String) -> String {
        let bundle = Bundle(for: type(of: self));
        let path = bundle.path(forResource: name, ofType: fileType)!;
        return path;
    }
}
