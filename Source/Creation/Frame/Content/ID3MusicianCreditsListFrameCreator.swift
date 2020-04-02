//
//  ID3MusicanCreditsListFrameCreator.swift
//
//  Created by Nolaine Crusher on 02/24/2020.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3MusicianCreditsListFrameCreator: ID3FrameCreatorsChain {
    private let frameCreator: CreditsListFrameCreator
    private var id3FrameConfiguration: ID3FrameConfiguration
    
    init(frameCreator: CreditsListFrameCreator, id3FrameConfiguration: ID3FrameConfiguration) {
        self.frameCreator = frameCreator
        self.id3FrameConfiguration = id3FrameConfiguration
    }
    
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let creditFrame = id3Tag.frames[.MusicianCredits] as? ID3FrameCreditsList {
            let newTag = tag +
                frameCreator.createFrame(
                    frameIdentifier: id3FrameConfiguration.identifierFor(
                        frameType: .MusicianCredits,
                        version: id3Tag.properties.version),
                    version: id3Tag.properties.version,
                    role: creditFrame.role,
                    person: creditFrame.person)
            return super.createFrames(id3Tag: id3Tag, tag: newTag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
    
    private func adapt(creditedRole: ID3FrameCreditsList) -> String {
        let roleString = creditedRole.role
        let personString = creditedRole.person
        return "\(roleString): \(personString)"
    }
}
