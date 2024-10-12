//
//  ContentView.swift
//  Demo tvOS
//
//  Created by Fabrizio Duroni on 12.10.2024.
//  Copyright © 2024 Fabrizio Duroni. All rights reserved.
//

import SwiftUI
import ID3TagEditor

struct ContentView: View {
    @State private var tag: ID3Tag?

    var body: some View {
        VStack {
            if let validTag = tag {
                if let data = (validTag.frames[.attachedPicture(.frontCover)] as? ID3FrameAttachedPicture)?.picture,
                   let validImage = UIImage(data: data) {
                    Image(uiImage: validImage)
                        .resizable()
                        .frame(width: 200, height: 200)
                }
                Text((validTag.frames[.title] as? ID3FrameWithStringContent)?.content ?? "")
                Text((validTag.frames[.album] as? ID3FrameWithStringContent)?.content ?? "")
                Text((validTag.frames[.genre] as? ID3FrameGenre)?.description ?? "")
                if let genreFrame = tag?.frames[.genre] as? ID3FrameGenre {
                    Text("\(genreFrame.identifier?.rawValue ?? 0) \(genreFrame.description ?? "")")
                }
                if let trackPositionFrame = tag?.frames[.trackPosition] as? ID3FramePartOfTotal {
                    Text("Track \(trackPositionFrame.part) of \(String(describing: trackPositionFrame.total ?? -1))")
                }
            }
        }
        .padding()
        .onAppear {
            let id3TagEditor = ID3TagEditor()
            tag = try? id3TagEditor.read(from: PathLoader().pathFor(name: "example", fileType: "mp3"))
        }
    }
}

#Preview {
    ContentView()
}
