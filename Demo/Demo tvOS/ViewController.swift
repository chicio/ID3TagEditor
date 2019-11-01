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
            titleLabel.text = (id3Tag?.frames[.Title] as? ID3FrameWithStringContent)?.content
            artistLabel.text = (id3Tag?.frames[.Artist] as? ID3FrameWithStringContent)?.content
            yearLabel.text = String((id3Tag?.frames[.RecordingDateTime] as? ID3FrameRecordingDateTime)?.recordingDateTime.date?.year ?? 0)
            genreLabel.text = """
                \((id3Tag?.frames[.Genre] as? ID3FrameGenre)?.identifier?.rawValue ?? 0)
                \((id3Tag?.frames[.Genre] as? ID3FrameGenre)?.description ?? "")
            """
            trackPositionLabel.text = """
                Track \((id3Tag?.frames[.TrackPosition] as? ID3FrameTrackPosition)?.position ?? -1) of
                \((id3Tag?.frames[.TrackPosition] as? ID3FrameTrackPosition)?.totalTracks ?? -1)
            """
            if let attachedPicture = (id3Tag?.frames[.AttachedPicture(.FrontCover)] as? ID3FrameAttachedPicture)?.picture {
                attachedPictureImage.image = UIImage(data: attachedPicture)
            }
        } catch {
            print(error)
        }
    }
}
