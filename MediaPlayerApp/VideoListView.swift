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
                    
                    HStack {
                        // Thumbnail
                        if let thumbnail = video.thumbnail {
                            Image(uiImage: thumbnail)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 45)
                            .clipped()
                            .cornerRadius(8)
                        }
                        else
                        {
                            Rectangle()
                            .fill(Color.gray)
                            .frame(width: 80, height: 45)
                            .cornerRadius(8)
                        }

                        // Video title and duration
                        VStack(alignment: .leading)
                        {
                            Text(video.name)
                            .font(.headline)
                            Text(video.duration)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
            .navigationTitle("Videos")
        }
    }
}

#Preview {
    VideoListView()
}
