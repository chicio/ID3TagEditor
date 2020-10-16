//
//  InterfaceController.swift
//  Demo watchOS Extension
//
//  Created by Fabrizio Duroni on 14/03/18.
//  2018 Fabrizio Duroni
//

import WatchKit
import Foundation
import ID3TagEditor

class InterfaceController: WKInterfaceController {
    private let id3TagEditor = ID3TagEditor()
    @IBOutlet var attachedPictureImage: WKInterfaceImage!
    @IBOutlet var titleLabel: WKInterfaceLabel!
    @IBOutlet var albumLabel: WKInterfaceLabel!
    @IBOutlet var genreLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        do {
            let id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example", fileType: "mp3"))
            attachedPictureImage.setImageData(
                (id3Tag?.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture
            )
            titleLabel.setText((id3Tag?.frames[.title] as? ID3FrameWithStringContent)?.content)
            albumLabel.setText((id3Tag?.frames[.album] as? ID3FrameWithStringContent)?.content)
            genreLabel.setText((id3Tag?.frames[.genre] as? ID3FrameGenre)?.description)
        } catch {
            print(error)
        }
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
}
