//
//  Clip.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 01.09.2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


struct Clip: Codable, Identifiable{
    var id: String = UUID().uuidString
    var athor: Author?
    var likeCount: Int = 0
    var favouriteCount: Int = 0
    var shareCount: Int = 0
    var comments: [Comment] = []
    var sound: Soundtrack?
    var insertAt: Timestamp = Timestamp(date: .now)
    var description: String
    var videoUrl: String
    var hashtags: [Hashtag] = []
    
    
    public func getHashtag() -> String{
        hashtags.compactMap({"#\($0.title)"}).joined(separator: " ")
    }
}

struct Hashtag: Codable{
    var id: String = UUID().uuidString
    var title: String
}


struct Soundtrack: Codable{
    var id: String = UUID().uuidString
    var imagePath: String?
    var title: String
}

struct Author: Codable{
    let uid: String?
    var avatarPath: String?
    var userName: String?
}

struct Comment: Codable, Identifiable{
    var id: String = UUID().uuidString
    var athor: Author?
    var likeCount: Int = 0
    var text: String
    var insertAt: Timestamp = Timestamp(date: .now)
}
