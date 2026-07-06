//
//  Video.swift
//  VideoPlayerApp
//
//  Created by Douglas Jasper on 2026-07-06.
//


import Foundation
import UIKit

struct Video: Identifiable {
    let id = UUID()
    let name: String
    let fileName: String
    let thumbnail: UIImage?
    let duration: String}
