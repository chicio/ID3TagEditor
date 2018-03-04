//
//  ViewController.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 03/03/2018.
//  2018 Fabrizio Duroni
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
            let id3TagEditor = try ID3TagEditor(path: PathLoader().pathFor(name: "example", fileType: "mp3"))
            id3TagEditor.set(title: titleTextField.text ?? "")
            id3TagEditor.set(album: albumTextField.text ?? "")
            id3TagEditor.set(artist: artistTextField.text ?? "")
            try id3TagEditor.write()
        } catch {
            print(error)
        }
    }
    
    @IBAction func load(_ sender: Any) {
        do {
            let id3TagEditor = try ID3TagEditor(path: PathLoader().pathFor(name: "example", fileType: "mp3"))
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
}
