//
//  Video.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 01.09.2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Video: Codable, Identifiable{
    var id: String = UUID().uuidString
    var title: String?
    var videoURL: String?
    var timestamp: Timestamp = Timestamp(date: .now)
    
    
    var date: String{
        timestamp.dateValue().formatted(date: .abbreviated, time: .omitted)
    }
}


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
