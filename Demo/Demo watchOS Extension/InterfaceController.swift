//
//  InterfaceController.swift
//  Demo watchOS Extension
//
//  Created by Fabrizio Duroni on 14.03.18.
//  Copyright © 2018 Fabrizio Duroni. All rights reserved.
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
            attachedPictureImage.setImageData(id3Tag?.attachedPictures?[0].art)
            titleLabel.setText(id3Tag?.title)
            albumLabel.setText(id3Tag?.album)
            genreLabel.setText(id3Tag?.genre?.description)
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
