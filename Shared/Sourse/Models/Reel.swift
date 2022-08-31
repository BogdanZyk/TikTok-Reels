//
//  Reel.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 31.08.2022.
//

import SwiftUI
import AVKit

struct Reel: Identifiable{
    var id = UUID().uuidString
    var player: AVPlayer?
    var mediaFile: MediaFile
}
