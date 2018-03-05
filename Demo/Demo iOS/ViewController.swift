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
    @IBOutlet weak var attachedPictureImage: UIImageView!
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
            let id3Tag = ID3Tag(
                version: .version3,
                artist: artistTextField.text,
                album: albumTextField.text,
                title: titleTextField.text,
                year: "2019",
                genre: Genre(genre: .ClassicRock, description: "Rock & Roll"),
                attachedPicture: nil
            )
            try id3TagEditor.write(tag: id3Tag)
        } catch {
            print(error)
        }
    }
    
    @IBAction func load(_ sender: Any) {
        do {
            let id3TagEditor = try ID3TagEditor(path: PathLoader().pathFor(name: "example", fileType: "mp3"))
            let id3Tag = id3TagEditor.read()
            titleTextField.text = id3Tag?.title
            albumTextField.text = id3Tag?.album
            artistTextField.text = id3Tag?.artist
            genreIdentifierField.text = "\(id3Tag?.genre?.identifier?.rawValue ?? 0)"
            genreDescriptionField.text = id3Tag?.genre?.description
            yearField.text = id3Tag?.year
            if let attachedPicture = id3Tag?.attachedPicture {
                attachedPictureImage.image = UIImage(data: attachedPicture.art)
            }
        } catch {
            print(error)
        }
    }
}
