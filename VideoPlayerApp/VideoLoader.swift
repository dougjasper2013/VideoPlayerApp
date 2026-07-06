//
//  VideoLoader.swift
//  VideoPlayerApp
//
//  Created by Douglas Jasper on 2026-07-06.
//


import Foundation

class VideoLoader: ObservableObject {
    @Published var videos: [Video] = []

    init() {
        loadVideos()
    }

    func loadVideos() {
        let fileManager = FileManager.default
        if let bundlePath = Bundle.main.resourcePath {
            do {
                let items = try fileManager.contentsOfDirectory(atPath: bundlePath)
                let videoFiles = items.filter { $0.hasSuffix(".mp4") }
                videos = videoFiles.map { Video(name: $0.replacingOccurrences(of: ".mp4", with: ""), fileName: $0) }
            } catch {
                print("Error loading videos: \(error)")
            }
        }
    }
}
