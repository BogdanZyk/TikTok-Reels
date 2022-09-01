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
