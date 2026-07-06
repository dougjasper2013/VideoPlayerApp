//
//  VideoListView.swift
//  VideoPlayerApp
//
//  Created by Douglas Jasper on 2026-07-06.
//

import SwiftUI

struct VideoListView: View {
    @StateObject private var videoLoader = VideoLoader()

    var body: some View {
        NavigationView {
            List(videoLoader.videos) { video in
                NavigationLink(destination: VideoPlayerView(videoName: video.name)) {
                    Text(video.name)
                }
            }
            .navigationTitle("Videos")
        }
    }
}

#Preview {
    VideoListView()
}
