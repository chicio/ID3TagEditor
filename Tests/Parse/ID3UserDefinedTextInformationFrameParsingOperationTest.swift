//
//  ID3UserDefinedTextInformationFrameParsingOperationTest.swift
//  ID3TagEditor
//
//  Created by Fabrizio Duroni on 26/07/2025.
//  2025 Fabrizio Duroni.
//

import Foundation
import Testing

@testable import ID3TagEditor

struct ID3UserDefinedTextInformationFrameParsingOperationTest {
    @Test func testParsingValidFrame() async {
        let userDefinedOperation = ID3UserDefinedTextInformationFrameContentParsingOperationFactory.make()

        await confirmation("user defined text information") { fulfill in
            userDefinedOperation.parse(frame: frameV3Valid(), version: .version3) { (frameName, frame) in
                if case let .userDefinedTextInformation(description) = frameName {
                    #expect(description == "Custom Field")
                }
                #expect((frame as? ID3FrameUserDefinedTextInformation)?.description == "Custom Field")
                #expect((frame as? ID3FrameUserDefinedTextInformation)?.content == "Custom Value")
                fulfill()
            }
        }
    }

    @Test func testParsingFrameWithEmptyContent() async {
        let userDefinedOperation = ID3UserDefinedTextInformationFrameContentParsingOperationFactory.make()

        await confirmation("user defined text information with empty content") { fulfill in
            userDefinedOperation.parse(frame: frameV3EmptyContent(), version: .version3) { (frameName, frame) in
                if case let .userDefinedTextInformation(description) = frameName {
                    #expect(description == "Empty Test")
                }
                #expect((frame as? ID3FrameUserDefinedTextInformation)?.description == "Empty Test")
                #expect((frame as? ID3FrameUserDefinedTextInformation)?.content == "")
                fulfill()
            }
        }
    }

    @Test func testParsingFrameV2() async {
        let userDefinedOperation = ID3UserDefinedTextInformationFrameContentParsingOperationFactory.make()

        await confirmation("user defined text information v2") { fulfill in
            userDefinedOperation.parse(frame: frameV2Valid(), version: .version2) { (frameName, frame) in
                if case let .userDefinedTextInformation(description) = frameName {
                    #expect(description == "V2 Field")
                }
                #expect((frame as? ID3FrameUserDefinedTextInformation)?.description == "V2 Field")
                #expect((frame as? ID3FrameUserDefinedTextInformation)?.content == "V2 Value")
                fulfill()
            }
        }
    }

    @Test func testParsingFrameV4WithUTF8() async {
        let userDefinedOperation = ID3UserDefinedTextInformationFrameContentParsingOperationFactory.make()

        await confirmation("user defined text information v4 utf8") { fulfill in
            userDefinedOperation.parse(frame: frameV4ValidUTF8(), version: .version4) { (frameName, frame) in
                if case let .userDefinedTextInformation(description) = frameName {
                    #expect(description == "UTF8 Field")
                }
                #expect((frame as? ID3FrameUserDefinedTextInformation)?.description == "UTF8 Field")
                #expect((frame as? ID3FrameUserDefinedTextInformation)?.content == "UTF8 Value 🎵")
                fulfill()
            }
        }
    }

    private func frameV3Valid() -> Data {
        let content = "Custom Field".data(using: .utf16)!
            + Data([0x00, 0x00]) // UTF16 null terminator
            + "Custom Value".data(using: .utf16)!
        return Data([
            0x54, 0x58, 0x58, 0x58, // TXXX identifier
            0x00, 0x00, 0x00, UInt8(content.count + 1), // size
            0x00, 0x00, // flags
            0x01 // UTF16 encoding
        ]) + content
    }

    private func frameV3EmptyContent() -> Data {
        let content = "Empty Test".data(using: .utf16)!
            + Data([0x00, 0x00]) // UTF16 null terminator
            + "".data(using: .utf16)!
        return Data([
            0x54, 0x58, 0x58, 0x58, // TXXX identifier
            0x00, 0x00, 0x00, UInt8(content.count + 1), // size
            0x00, 0x00, // flags
            0x01 // UTF16 encoding
        ]) + content
    }

    private func frameV2Valid() -> Data {
        let content = "V2 Field".data(using: .isoLatin1)!
            + Data([0x00]) // ISO-8859-1 null terminator
            + "V2 Value".data(using: .isoLatin1)!
        return Data([
            0x54, 0x58, 0x58, // TXX identifier
            UInt8((content.count + 1) >> 16),
            UInt8((content.count + 1) >> 8),
            UInt8(content.count + 1), // size (3 bytes)
            0x00 // ISO-8859-1 encoding
        ]) + content
    }

    private func frameV4ValidUTF8() -> Data {
        let content = "UTF8 Field".data(using: .utf8)!
            + Data([0x00]) // UTF8 null terminator
            + "UTF8 Value 🎵".data(using: .utf8)!
        return Data([
            0x54, 0x58, 0x58, 0x58, // TXXX identifier
            0x00, 0x00, 0x00, UInt8(content.count + 1), // size
            0x00, 0x00, // flags
            0x03 // UTF8 encoding
        ]) + content
    }
}