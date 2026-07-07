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
    @State private var isSharing = false

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
                    ShareSheet(activityItems: [URL(fileURLWithPath: path)])
                }
        }
        else if  let path = Bundle.main.path(forResource: videoName, ofType: "m4v") {
            let player = AVPlayer(url: URL(fileURLWithPath: path))
            VideoPlayer(player: player)
                .onAppear {
                    player.play()
                }
                .onDisappear {
                    player.pause()
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
                ShareSheet(activityItems: [URL(fileURLWithPath: path)])
                }
            }
            else {
            Text("Video not found")
        }
    }
}

#Preview {
    VideoPlayerView(videoName: "BookTrailer")
}
