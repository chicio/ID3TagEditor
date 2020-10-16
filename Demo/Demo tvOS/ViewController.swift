//
//  ViewController.swift
//  Demo tvOS
//
//  Created by Fabrizio Duroni on 14.03.18.
//  Copyright © 2018 Fabrizio Duroni. All rights reserved.
//

import UIKit
import ID3TagEditor

class ViewController: UIViewController {
    private let id3TagEditor = ID3TagEditor()
    @IBOutlet weak var attachedPictureImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var trackPositionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example", fileType: "mp3"))
            titleLabel.text = (id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.content
            artistLabel.text = (id3Tag?.frames[.artist] as? ID3FrameWithStringContent)?.content
            yearLabel.text = String((id3Tag?.frames[.recordingYear] as? ID3FrameRecordingYear)?.year ?? 0)
            genreLabel.text = "\((id3Tag?.frames[.genre] as? ID3FrameGenre)?.identifier?.rawValue ?? 0) \((id3Tag?.frames[.genre] as? ID3FrameGenre)?.description ?? "")"
            trackPositionLabel.text = "Track \((id3Tag?.frames[.trackPosition] as? ID3FramePartOfTotal)?.part ?? -1) of \((id3Tag?.frames[.trackPosition] as? ID3FramePartOfTotal)?.total ?? -1)"
            if let attachedPicture = (id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture {
                attachedPictureImage.image = UIImage(data: attachedPicture)
            }
        } catch {
            print(error)
        }
    }
}
