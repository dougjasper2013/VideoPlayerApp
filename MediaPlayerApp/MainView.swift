//
//  MainView.swift
//  MediaPlayerApp
//
//  Created by Douglas Jasper on 2026-07-07.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            NavigationView {
                VideoListView()
            }
            .tabItem {
                Label("Videos", systemImage: "film")
            }

            NavigationView {
                AudioListView() // Placeholder for future AudioPlayer
            }
            .tabItem {
                Label("Audio", systemImage: "music.note")
            }
        }
    }
}

#Preview {
    MainView()
}
