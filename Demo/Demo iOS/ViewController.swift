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
            let defaultGenre = ID3Genre(rawValue: 1)!
            let genreTextFieldContent = Int(genreIdentifierField.text ?? "1") ?? 1
            let id3Tag = ID32v3TagBuilder()
                .title(frame: ID3FrameWithStringContent(content: titleTextField.text ?? ""))
                .artist(frame: ID3FrameWithStringContent(content: artistTextField.text ?? ""))
                .albumArtist(frame: ID3FrameWithStringContent(content: albumArtistField.text ?? ""))
                .album(frame: ID3FrameWithStringContent(content: albumTextField.text ?? ""))
                .recordingYear(frame: ID3FrameRecordingYear(year: Int(yearField.text ?? "2019") ?? 2019))
                .genre(frame: ID3FrameGenre(genre: ID3Genre(rawValue: genreTextFieldContent) ?? defaultGenre,
                                            description: genreDescriptionField.text ?? "Rock and roll"))
                .trackPosition(frame: ID3FramePartOfTotal(part: 2, total: 9))
                .build()
            let documentDirectory = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false
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
            var id3Tag: ID3Tag?
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
            let url = NSURL(fileURLWithPath: path)
            if let pathComponent = url.appendingPathComponent("example.mp3") {
                let filePath = pathComponent.path
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath) {
                    let documentDirectory = try FileManager.default.url(
                        for: .documentDirectory,
                        in: .userDomainMask,
                        appropriateFor: nil,
                        create: false
                    )
                    let newPath = documentDirectory.appendingPathComponent("example.mp3").path
                    id3Tag = try id3TagEditor.read(from: newPath)
                } else {
                    id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example", fileType: "mp3"))
                }
            } else {
                id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example", fileType: "mp3"))
            }

            titleTextField.text = (id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.content
            albumTextField.text = (id3Tag?.frames[.album] as? ID3FrameWithStringContent)?.content
            albumArtistField.text = (id3Tag?.frames[.albumArtist] as? ID3FrameWithStringContent)?.content
            artistTextField.text = (id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?.content
            // genre is setted only by the
            genreIdentifierField.text = "\((id3Tag?.frames[.genre] as? ID3FrameGenre)?.identifier?.rawValue ?? -1)"
            genreDescriptionField.text = (id3Tag?.frames[.genre] as? ID3FrameGenre)?.description
            yearField.text = "\((id3Tag?.frames[.recordingYear] as? ID3FrameRecordingYear)?.year ?? 0)"
            if let attachedPictureFrame = id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture {
                attachedPictureImage.image = UIImage(data: attachedPictureFrame.picture)
            } else {
                //image is removed when the user press the update button
                attachedPictureImage.image = nil
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
