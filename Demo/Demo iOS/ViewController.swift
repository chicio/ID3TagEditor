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
    @IBOutlet weak var genreIdentifierField: UITextField!
    @IBOutlet weak var genreDescriptionField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func update(_ sender: Any) {
        do {
            let id3TagEditor = try ID3TagEditor(path: PathLoader().pathFor(name: "example", fileType: "mp3"))
            id3TagEditor.set(title: titleTextField.text ?? "")
            id3TagEditor.set(album: albumTextField.text ?? "")
            id3TagEditor.set(artist: artistTextField.text ?? "")
            id3TagEditor.set(genre: Genre(genre: .ClassicRock, description: "Rock & Roll"))
            id3TagEditor.set(year: "2019")
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
            genreIdentifierField.text = "\(id3TagEditor.getGenre()?.genre?.rawValue ?? 0)"
            genreDescriptionField.text = id3TagEditor.getGenre()?.description
            yearField.text = id3TagEditor.getYear()
            if let artwork = id3TagEditor.getArtwork() {
                artworkImage.image = UIImage(data: artwork)
            }
        } catch {
            print(error)
        }
    }
}
