//
//  AudioListView.swift
//  MediaPlayerApp
//
//  Created by Douglas Jasper on 2025-11-05.
//

import SwiftUI

struct AudioListView: View {
    @StateObject private var audioLoader = AudioLoader()

    var body: some View {
        List(audioLoader.audioFiles) { audio in
            NavigationLink(destination: AudioPlayerView(fileName: audio.fileName)) {
                HStack {
                    Image(systemName: "music.note")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.blue)

                    VStack(alignment: .leading) {
                        Text(audio.name).font(.headline)
                        Text(audio.duration).font(.subheadline).foregroundColor(.gray)
                    }
                }
                .padding(.vertical, 5)
            }
        }
        .navigationTitle("Audio Files")
        .onAppear { audioLoader.loadAudioFiles() }
    }
}

#Preview {
    AudioListView()
}
