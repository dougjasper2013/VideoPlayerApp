//
//  VideoListView.swift
//  VideoPlayerApp
//
//  Created by Douglas Jasper on 2025-11-04.
//

import SwiftUI

struct VideoListView: View {
    @StateObject private var videoLoader = VideoLoader()

    var body: some View {
        NavigationView {
            List(videoLoader.videos) { video in
                NavigationLink(destination: VideoPlayerView(videoName: video.fileName)) {
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
