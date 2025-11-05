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
        List(videoLoader.videos) { video in
            NavigationLink(destination: VideoPlayerView(fileName: video.fileName)) {
                HStack {
                    if let thumbnail = video.thumbnail {
                        Image(uiImage: thumbnail)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 45)
                            .clipped()
                            .cornerRadius(8)
                    } else {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 80, height: 45)
                            .cornerRadius(8)
                    }

                    VStack(alignment: .leading) {
                        Text(video.name).font(.headline)
                        Text(video.duration).font(.subheadline).foregroundColor(.gray)
                    }
                }
                .padding(.vertical, 5)
            }
        }
        .navigationTitle("Videos")
        .onAppear { videoLoader.loadVideos() }
    }
}

#Preview {
    VideoListView()
}
