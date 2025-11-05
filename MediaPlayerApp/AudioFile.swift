//
//  AudioFile.swift
//  MediaPlayerApp
//
//  Created by Douglas Jasper on 2025-11-05.
//

import SwiftUI

struct AudioFile: Identifiable {
    let id = UUID()
    let name: String
    let fileName: String
    let duration: String
}
