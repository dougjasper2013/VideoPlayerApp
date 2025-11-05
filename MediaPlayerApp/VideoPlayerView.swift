//
//  VideoPlayerView.swift
//  VideoPlayerApp
//
//  Created by Douglas Jasper on 2025-11-04.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let fileName: String
    @State private var player: AVPlayer?
    @State private var isSharing = false

    var body: some View {
        VStack {
            if let path = Bundle.main.path(forResource: fileName, ofType: nil) {
                let url = URL(fileURLWithPath: path) // Get video URL
                
                // Video Player
                VideoPlayer(player: player)
                    .onAppear {
                        player = AVPlayer(url: url)
                        player?.play()
                    }
                    .onDisappear {
                        player?.pause()
                        player?.seek(to: .zero)
                    }
                
                // Share Button
                Button(action: {
                    isSharing = true
                }) {
                    Label("Share Video", systemImage: "square.and.arrow.up")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                .sheet(isPresented: $isSharing) {
                    ShareSheet(activityItems: [url])
                }
            } else {
                Text("Video not found")
                    .foregroundColor(.red)
                    .onAppear {
                        print("❌ Video not found: \(fileName)")
                    }
            }
        }
    }
}

#Preview {
    VideoPlayerView(fileName: "BookTrailer.m4v")
}
