//
//  AudioPlaceholderView.swift
//  MediaPlayerApp
//
//  Created by Douglas Jasper on 2025-11-05.
//

import SwiftUI

struct AudioPlaceholderView: View {
    var body: some View {
        VStack {
            Image(systemName: "music.note.list")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
            Text("Audio Player Coming Soon!")
                .font(.title2)
                .foregroundColor(.gray)
        }
        .navigationTitle("Audio")
    }
}

#Preview {
    AudioPlaceholderView()
}
