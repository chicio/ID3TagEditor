//
//  ViewController.swift
//  Demo iOS
//
//  Created by Fabrizio Duroni on 03/03/2018.
//  2018 Fabrizio Duroni
//

import UIKit
import ID3TagEditor

class ViewController: UIViewController, UITextFieldDelegate {
    private let id3TagEditor = ID3TagEditor()
    @IBOutlet weak var attachedPictureImage: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var albumTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    @IBOutlet weak var albumArtistField: UITextField!
    @IBOutlet weak var genreIdentifierField: UITextField!
    @IBOutlet weak var genreDescriptionField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.delegate = self
        albumTextField.delegate = self
        artistTextField.delegate = self
        albumArtistField.delegate = self
        genreIdentifierField.delegate = self
        genreDescriptionField.delegate = self
        yearField.delegate = self
    }
    
    @IBAction func update(_ sender: Any) {
        do {
            let id3Tag = ID3Tag(
                version: .version3,
                frames: [
                    .Artist : ID3FrameWithStringContent(content: artistTextField.text ?? ""),
                    .AlbumArtist : ID3FrameWithStringContent(content: albumArtistField.text ?? ""),
                    .Title : ID3FrameWithStringContent(content: titleTextField.text ?? ""),
                    .Album : ID3FrameWithStringContent(content: albumTextField.text ?? ""),
                    .RecordingYear : ID3FrameRecordingYear(year: 2019),
                    .Genre : ID3FrameGenre(genre: .ClassicRock, description: "Rock & Roll"),
                    .TrackPosition: ID3FramePartOfTotal(part: 2, total: 9)
                ]
            )
            let documentDirectory = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor:nil,
                create:false
            )
            let newPath = documentDirectory.appendingPathComponent("example.mp3").path
            print(PathLoader().pathFor(name: "example", fileType: "mp3"))
            print(newPath)
            try id3TagEditor.write(
                tag: id3Tag,
                to: PathLoader().pathFor(name: "example", fileType: "mp3"),
                andSaveTo: newPath
            )
        } catch {
            print(error)
        }
    }
    
    @IBAction func load(_ sender: Any) {
        do {
            let id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example", fileType: "mp3"))
            titleTextField.text = (id3Tag?.frames[.Title] as? ID3FrameWithStringContent)?.content
            albumTextField.text = (id3Tag?.frames[.Album] as? ID3FrameWithStringContent)?.content
            albumArtistField.text = (id3Tag?.frames[.AlbumArtist] as? ID3FrameWithStringContent)?.content
            artistTextField.text = (id3Tag?.frames[.Artist] as? ID3FrameWithStringContent)?.content
            genreIdentifierField.text = "\((id3Tag?.frames[.Genre] as? ID3FrameGenre)?.identifier?.rawValue ?? 0)"
            genreDescriptionField.text = (id3Tag?.frames[.Genre] as? ID3FrameGenre)?.description
            yearField.text = "\((id3Tag?.frames[.RecordingYear] as? ID3FrameRecordingYear)?.year ?? 0)"
            if let attachedPicture = (id3Tag?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.picture {
                attachedPictureImage.image = UIImage(data: attachedPicture)
            }
        } catch {
            print(error)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
