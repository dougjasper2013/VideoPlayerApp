//
//  AudioLoader.swift
//  MediaPlayerApp
//
//  Created by Douglas Jasper on 2025-11-05.
//

import AVFoundation
import UIKit

class AudioLoader: ObservableObject {
    @Published var audioFiles: [AudioFile] = []
    
    func loadAudioFiles() {
        let fileManager = FileManager.default
        if let bundlePath = Bundle.main.resourcePath {
            do {
                let items = try fileManager.contentsOfDirectory(atPath: bundlePath)
                let audioFiles = items.filter { $0.hasSuffix(".mp3") || $0.hasSuffix(".wav") }
                
                self.audioFiles = audioFiles.map { file in
                    let nameWithoutExtension = (file as NSString).deletingPathExtension
                    let audioURL = URL(fileURLWithPath: bundlePath).appendingPathComponent(file)
                    let duration = getAudioDuration(for: audioURL)
                    
                    return AudioFile(name: nameWithoutExtension, fileName: file, duration: duration)
                }
            } catch {
                print("❌ Error loading audio files: \(error)")
            }
        }
    }
    
    private func getAudioDuration(for url: URL) -> String {
        let asset = AVAsset(url: url)
        let duration = CMTimeGetSeconds(asset.duration)
        
        let minutes = Int(duration) / 60
        let seconds = Int(duration) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
