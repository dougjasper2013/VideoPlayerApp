//
//  MainView.swift
//  MediaPlayerApp
//
//  Created by Douglas Jasper on 2025-11-05.
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
                AudioListView() 
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
