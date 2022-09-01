//
//  MediaFile.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 31.08.2022.
//

import SwiftUI

struct MediaFile: Identifiable{
    var id = UUID().uuidString
    var url: String
    var title: String
    var isExpanded: Bool = false
}

var MediaFileJSON: [MediaFile] = [

   
    MediaFile(url: "bear", title: "Funny bear"),
    MediaFile(url: "dance", title: "Take 2 charot hahahahahaha"),
    MediaFile(url: "anime", title: "coool"),
    MediaFile(url: "dance2", title: "pengen panjangin rambut"),
    MediaFile(url: "girls", title: "nice"),
    MediaFile(url: "food", title: "fypdongggggggg")

]
