//
//  ID3AttachedPictureFrameContentParsingOperation.swift
//
//  Created by Fabrizio Duroni on 26/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

class ID3AttachedPictureFrameContentParsingOperation: FrameContentParsingOperation {

    // Magic file numbers for standard attached picture image formats
    private let standardImageFormats: [ID3PictureFormat: Data] = [
        .jpeg: Data([0xFF, 0xD8, 0xFF, 0xE0]),
        .png: Data([0x89, 0x50, 0x4E, 0x47])
    ]

    private let id3FrameConfiguration: ID3FrameConfiguration
    private let pictureTypeAdapter: PictureTypeAdapter

    init(id3FrameConfiguration: ID3FrameConfiguration, pictureTypeAdapter: PictureTypeAdapter) {
        self.id3FrameConfiguration = id3FrameConfiguration
        self.pictureTypeAdapter = pictureTypeAdapter
    }

    func parse(frame: Data, version: ID3Version, completed: (FrameName, ID3Frame) -> Void) {
        var imageIsInAStandardFormat = false
        for imageFormat in standardImageFormats {
            if parseToCheckIfThereIsAnImageUsing(magicNumber: imageFormat.value,
                                                 format: imageFormat.key,
                                                 frame: frame,
                                                 version: version,
                                                 completed: completed) {
                imageIsInAStandardFormat = true
                break
            }
        }
        if !imageIsInAStandardFormat {
            parseNonStandardImageFormat(frame: frame,
                                        version: version,
                                        completed: completed)
        }
    }

    private func parseToCheckIfThereIsAnImageUsing(magicNumber: Data,
                                                   format: ID3PictureFormat,
                                                   frame: Data,
                                                   version: ID3Version,
                                                   completed: (FrameName, ID3Frame) -> Void) -> Bool {
        if let magicNumberRange = frame.range(of: magicNumber) {
            let pictureType = pictureTypeAdapter.adapt(frame: frame, format: format, version: version)
            let attachedPictureFrame = ID3FrameAttachedPicture(
                picture: frame.subdata(in: magicNumberRange.lowerBound..<frame.count),
                type: pictureType,
                format: format
            )
            completed(.attachedPicture(pictureType), attachedPictureFrame)
            return true
        }
        return false
    }

    private func parseNonStandardImageFormat(frame: Data,
                                             version: ID3Version,
                                             completed: (FrameName, ID3Frame) -> Void) {

        // These are the values of the "text encoding description byte" from the ID3 standard,
        // mapped into Cocoa encodings and length of string null terminator.

        // From the ID3 standard:
        /* Frames that allow different types of text encoding contain a text
        encoding description byte. Possible encodings:

          $00   ISO-8859-1 [ISO-8859-1]. Terminated with $00.
          $01   UTF-16 [UTF-16] encoded Unicode [UNICODE] with BOM. All
                strings in the same frame SHALL have the same byteorder.
                Terminated with $00 00.
          $02   UTF-16BE [UTF-16] encoded Unicode [UNICODE] without BOM.
                Terminated with $00 00.
          $03   UTF-8 [UTF-8] encoded Unicode [UNICODE]. Terminated with $00
         
         We're not using the String.Encoding values yet, but they could be used to parse out
         the MIME type and Description strings from the APIC frame, if desired.
         
         */

        let ID3TextEncodings: [UInt8: (String.Encoding, Int)] = [
            0: (String.Encoding.ascii, 1),
            1: (String.Encoding.utf16, 2),
            2: (String.Encoding.utf16BigEndian, 2),
            3: (String.Encoding.utf8, 1)
        ]

        let headerSize = id3FrameConfiguration.headerSizeFor(version: version)
        guard frame.endIndex > headerSize else { return }

        // First byte after the header is the text encoding value
        guard let (textEncoding, terminatorLength): (String.Encoding, Int) = ID3TextEncodings[frame[headerSize]] else {
            return
        }

        // Make a string terminator for the chosen text encoding
        let terminator = Data(count: terminatorLength) // Data filled with zero(s)

        // Skip past the MIME type string in the APIC frame
        let frameIndex = headerSize + 1
        var remainingFrame = frame.suffix(from: frameIndex)
        var indexInFrame = findTermintorIn(data: remainingFrame, targetBytes: terminator)
        guard indexInFrame > -1 else { return }

        // Grab the picture type of the APIC frame
        let pictureType = ID3PictureType(rawValue: frame[indexInFrame]) ?? .other
        remainingFrame = frame.suffix(from: indexInFrame + 1)

        // Skip past the Description string in the APIC frame
        indexInFrame = findTermintorIn(data: remainingFrame, targetBytes: terminator)
        guard indexInFrame > -1 else { return }

        // Read the file format magic number
        let magicNumber = frame[indexInFrame..<indexInFrame + 4]

        // Make attached picture frame
        let attachedPictureFrame = ID3FrameAttachedPicture(
            picture: frame.subdata(in: indexInFrame..<frame.count),
            type: pictureType,
            format: .nonStandard(magicNumber)
        )
        completed(.attachedPicture(pictureType), attachedPictureFrame)
    }

    // Find the given target bytes in the given data object; return the index of the end of those
    // bytes, or -1 if not found
    private func findTermintorIn(data: Data, targetBytes: Data) -> Int {
        guard let range = data.range(of: targetBytes) else { return -1 }
        return range.upperBound
    }

}
