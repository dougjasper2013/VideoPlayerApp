//
//  VideoPlayerView.swift
//  VideoPlayerApp
//
//  Created by Douglas Jasper on 2025-11-04.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let videoName: String

    var body: some View {
        VStack {
            // Try loading both mp4 and m4v using the stored fileName
            if let path = Bundle.main.path(forResource: videoName, ofType: nil) {
                let player = AVPlayer(url: URL(fileURLWithPath: path))
                VideoPlayer(player: player)
                    .onAppear { player.play() }
            } else {
                Text("Video not found")
                    .foregroundColor(.red)
                    .onAppear {
                        print("❌ Video not found: \(videoName)")
                    }
            }
        }
    }
}

#Preview {
    VideoPlayerView(videoName: "BookTrailer.m4v")
}
