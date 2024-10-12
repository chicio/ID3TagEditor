//
//  ContentView.swift
//  Demo iOS
//
//  Created by Fabrizio Duroni on 12.10.2024.
//  Copyright © 2024 Fabrizio Duroni. All rights reserved.
//

import SwiftUI
import ID3TagEditor

class FormData: ObservableObject {
    @Published var title: String = ""
    @Published var album: String = ""
    @Published var artist: String = ""

    func update(newTitle: String, newAlbum: String, newArtist: String) {
        self.title = newTitle
        self.album = newAlbum
        self.artist = newArtist
    }
}

struct ContentView: View {
    private let id3TagEditor = ID3TagEditor()
    @StateObject private var formData = FormData()
    @State private var imageData: Data?
    @State private var showAlert: Bool = false

    var body: some View {
        VStack {
            if let validImageData = imageData, let validImage = UIImage(data: validImageData) {
                Image(uiImage: validImage)
                    .resizable()
                    .frame(width: 200, height: 200)
            }
                
            Form {
                TextField("Title", text: $formData.title)
                TextField("Album", text: $formData.album)
                TextField("Artist", text: $formData.artist)
                Button("Update") {
                    let id3Tag = ID32v3TagBuilder()
                        .title(frame: ID3FrameWithStringContent(content: formData.title))
                        .artist(frame: ID3FrameWithStringContent(content: formData.artist))
                        .album(frame: ID3FrameWithStringContent(content: formData.album))
                        .build()
                    let documentDirectory = try? FileManager.default.url(
                        for: .documentDirectory,
                        in: .userDomainMask,
                        appropriateFor: nil,
                        create: false
                    )
                    if let newPath = documentDirectory?.appendingPathComponent("example.mp3").path {
                        print(PathLoader().pathFor(name: "example", fileType: "mp3"))
                        print(newPath)
                        try? id3TagEditor.write(
                            tag: id3Tag,
                            to: PathLoader().pathFor(name: "example", fileType: "mp3"),
                            andSaveTo: newPath
                        )
                        showAlert = true
                    } else {
                        print("error")
                    }
                }
                Button("Load") {
                    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
                    let url = NSURL(fileURLWithPath: path)
                    if let pathComponent = url.appendingPathComponent("example.mp3") {
                        let filePath = pathComponent.path
                        let fileManager = FileManager.default
                        if fileManager.fileExists(atPath: filePath) {
                            let documentDirectory = try! FileManager.default.url(
                                for: .documentDirectory,
                                in: .userDomainMask,
                                appropriateFor: nil,
                                create: false
                            )
                            let newPath = documentDirectory.appendingPathComponent("example.mp3").path
                            if let tag = try! id3TagEditor.read(from: newPath) {
                                formData.update(
                                    newTitle: (tag.frames[.title] as? ID3FrameWithStringContent)?.content ?? "",
                                    newAlbum: (tag.frames[.album] as? ID3FrameWithStringContent)?.content ?? "",
                                    newArtist: (tag.frames[.artist] as? ID3FrameWithStringContent)?.content ?? ""
                                )
                                showAlert = true
                            }
                        } else {
                            print("Error")
                        }
                    }
                }
            }

        }
        .padding()
        .onAppear {
            if let tag = try? id3TagEditor.read(from: PathLoader().pathFor(name: "example", fileType: "mp3")) {
                imageData = (tag.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture
                formData.update(
                    newTitle: (tag.frames[.title] as? ID3FrameWithStringContent)?.content ?? "",
                    newAlbum: (tag.frames[.album] as? ID3FrameWithStringContent)?.content ?? "",
                    newArtist: (tag.frames[.artist] as? ID3FrameWithStringContent)?.content ?? ""
                )
            }
        }
        .alert("Completed", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

#Preview {
    ContentView()
}
