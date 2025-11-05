//
//  Video.swift
//  VideoPlayerApp
//
//  Created by Douglas Jasper on 2025-11-04.
//

import SwiftUI

struct Video: Identifiable {
    let id = UUID()
    let name: String
    let fileName: String
    let thumbnail: UIImage?
    let duration: String
}
