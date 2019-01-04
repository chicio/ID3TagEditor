//
//  ViewController.swift
//  Demo iOS
//
//  Created by Fabrizio Duroni on 03/03/2018.
//  2018 Fabrizio Duroni
//

import UIKit
import ID3TagEditor

class ViewController: UIViewController {
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
                    .TrackPosition: ID3FrameTrackPosition(position: 2, totalTracks: 9)
                ]
            )
            try id3TagEditor.write(tag: id3Tag, to: PathLoader().pathFor(name: "example", fileType: "mp3"))
        } catch {
            print(error)
        }
    }
    
    @IBAction func load(_ sender: Any) {
        do {
            let id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example", fileType: "mp3"))
            titleTextField.text = (id3Tag?.frames[.Title] as? ID3FrameWithStringContent)?.content
            albumTextField.text = (id3Tag?.frames[.Title] as? ID3FrameWithStringContent)?.content
            albumArtistField.text = (id3Tag?.frames[.AlbumArtist] as? ID3FrameWithStringContent)?.content
            artistTextField.text = (id3Tag?.frames[.Artist] as? ID3FrameWithStringContent)?.content
            genreIdentifierField.text = "\(id3Tag?.genre?.identifier?.rawValue ?? 0)"
            genreDescriptionField.text = id3Tag?.genre?.description
            yearField.text = "\(id3Tag?.recordingDateTime?.date?.year ?? 0)"
            if let attachedPictures = id3Tag?.attachedPictures, attachedPictures.count > 0 {
                attachedPictureImage.image = UIImage(data: attachedPictures[0].picture)
            }
        } catch {
            print(error)
        }
    }
}
