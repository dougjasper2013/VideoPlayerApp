//
//  VideoLoader.swift
//  VideoPlayerApp
//
//  Created by Douglas Jasper on 2026-07-06.
//


import Foundation
import AVFoundation
import Combine
import UIKit

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
                let videoFiles = items.filter { $0.hasSuffix(".mp4") || $0.hasSuffix("m4v") }
                videos = videoFiles.map { Video(name: $0.replacingOccurrences(of: ".mp4", with: ""), fileName: $0, thumbnail: generateThumbnail(for: URL(fileURLWithPath: bundlePath).appendingPathComponent($0)), duration: getVideoDuration(for: URL(fileURLWithPath: bundlePath).appendingPathComponent($0)))
                }
                videos = videoFiles.map { Video(name: $0.replacingOccurrences(of: ".m4v", with: ""), fileName: $0, thumbnail: generateThumbnail(for: URL(fileURLWithPath: bundlePath).appendingPathComponent($0)), duration: getVideoDuration(for: URL(fileURLWithPath: bundlePath).appendingPathComponent($0)))
                }
            }
            catch
            {
                print("Error loading videos: \(error)")
            }
        }
    }
    
    // Function to get video duration
        private func getVideoDuration(for url: URL) -> String {
            let asset = AVAsset(url: url)
            let duration = CMTimeGetSeconds(asset.duration)
            
            let minutes = Int(duration) / 60
            let seconds = Int(duration) % 60
            return String(format: "%02d:%02d", minutes, seconds) // Format as MM:SS
        }

        // Function to generate a thumbnail
        private func generateThumbnail(for url: URL) -> UIImage? {
            let asset = AVAsset(url: url)
            let imageGenerator = AVAssetImageGenerator(asset: asset)
            imageGenerator.appliesPreferredTrackTransform = true

            let time = CMTime(seconds: 1, preferredTimescale: 600) // Capture frame at 1 second
            do {
                let cgImage = try imageGenerator.copyCGImage(at: time, actualTime: nil)
                return UIImage(cgImage: cgImage)
            } catch {
                print("❌ Error generating thumbnail for \(url): \(error)")
                return nil
            }
        }
}
