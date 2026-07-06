//
//  VideoPlayerView.swift
//  VideoPlayerApp
//
//  Created by Douglas Jasper on 2026-07-06.
//


import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let videoName: String

    var body: some View {
        if let path = Bundle.main.path(forResource: videoName, ofType: "mp4") {
            let player = AVPlayer(url: URL(fileURLWithPath: path))
            VideoPlayer(player: player)
                .onAppear {
                    player.play()
                }
                .onDisappear {
                    player.pause()
                }
        } else {
            Text("Video not found")
        }
    }
}

#Preview {
    VideoPlayerView(videoName: "BookTrailer.m4v")
}
