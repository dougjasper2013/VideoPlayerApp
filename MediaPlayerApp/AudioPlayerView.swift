//
//  AudioPlayerView.swift
//  MediaPlayerApp
//
//  Created by Douglas Jasper on 2026-07-07.
//

import SwiftUI
import AVFoundation

struct AudioPlayerView: View {
    let fileName: String

    @State private var player: AVAudioPlayer?
    @State private var audioURL: URL?
    @State private var showingShareSheet = false

    var body: some View {
        VStack(spacing: 30) {

            Image(systemName: "music.note")
                .font(.system(size: 80))
                .foregroundColor(.blue)

            Text((fileName as NSString).deletingPathExtension)
                .font(.title2)

            HStack(spacing: 40) {

                Button(action: playAudio) {
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.green)
                }

                Button(action: pauseAudio) {
                    Image(systemName: "pause.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.orange)
                }

                Button(action: stopAudio) {
                    Image(systemName: "stop.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.red)
                }
            }

            Button {
                showingShareSheet = true
            } label: {
                Label("Share Audio", systemImage: "square.and.arrow.up")
                    .font(.headline)
            }
            .buttonStyle(.borderedProminent)
            .disabled(audioURL == nil)

            Spacer()
        }
        .padding()
        .navigationTitle("Audio Player")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            setupAudioPlayer()
        }
        .onDisappear {
            stopAudio()
        }
        .sheet(isPresented: $showingShareSheet) {
            if let audioURL {
                ShareSheet(activityItems: [audioURL])
            }
        }
    }

    private func setupAudioPlayer() {

        guard let path = Bundle.main.path(forResource: fileName, ofType: nil) else {
            return
        }

        let url = URL(fileURLWithPath: path)
        audioURL = url

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
        } catch {
            print("Error loading audio: \(error)")
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
    AudioPlayerView(fileName: "PocketCyclopsLvl1.mp3")
}
