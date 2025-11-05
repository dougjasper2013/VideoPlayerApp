//
//  AudioPlayerView.swift
//  MediaPlayerApp
//
//  Created by Douglas Jasper on 2025-11-05.
//

import SwiftUI
import AVFoundation

struct AudioPlayerView: View {
    let fileName: String
    @State private var player: AVAudioPlayer?

    var body: some View {
        VStack {
            Text(fileName)
                .font(.title2)
                .padding()

            HStack {
                Button(action: playAudio) {
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.green)
                }

                Button(action: pauseAudio) {
                    Image(systemName: "pause.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.yellow)
                }

                Button(action: stopAudio) {
                    Image(systemName: "stop.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.red)
                }
            }
            .padding()
        }
        .onAppear { setupAudioPlayer() }
        .onDisappear { stopAudio() }
    }

    private func setupAudioPlayer() {
        if let path = Bundle.main.path(forResource: fileName, ofType: nil) {
            let url = URL(fileURLWithPath: path)
            do {
                player = try AVAudioPlayer(contentsOf: url)
            } catch {
                print("❌ Error loading audio file: \(error)")
            }
        }
    }

    private func playAudio() {
        player?.play()
    }

    private func pauseAudio() {
        player?.pause()
    }

    private func stopAudio() {
        player?.stop()
        player?.currentTime = 0
    }
}


#Preview {
    AudioPlayerView(fileName: "bounce.wav")
}
