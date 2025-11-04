//
//  VideoLoader.swift
//  VideoPlayerApp
//
//  Created by Douglas Jasper on 2025-11-04.
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
                
                // Filter files that end with .mp4 or .m4v
                let videoFiles = items.filter { $0.hasSuffix(".mp4") || $0.hasSuffix(".m4v") }
                
                // Store both name (without extension) and full filename (with extension)
                videos = videoFiles.map { file in
                    let nameWithoutExtension = (file as NSString).deletingPathExtension
                    return Video(name: nameWithoutExtension, fileName: file)
                }
            } catch {
                print("❌ Error loading videos: \(error)")
            }
        }
    }
}
