//
//  MockData.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 02.09.2022.
//

import Foundation


class MockData{
    
    static let videos: [Video] = [
        
        
                Video(title: "Burgers 🍔", videoURL: "https://firebasestorage.googleapis.com/v0/b/tiktokreels-443d9.appspot.com/o/food.mp4?alt=media&token=9713528e-07cd-4b04-af6c-6e6f4878983e"),
                Video(title: "😂😂😂", videoURL: "https://firebasestorage.googleapis.com/v0/b/tiktokreels-443d9.appspot.com/o/watermellon.mp4?alt=media&token=29bb8ea3-01d9-4782-9bb1-0e786f57a557"),
                
        
//        Video(title: "Funny bear", videoURL: "https://firebasestorage.googleapis.com/v0/b/tiktokreels-443d9.appspot.com/o/bear.mp4?alt=media&token=07b3bff2-7e8d-480f-b2bd-fe1667d404f0"),
//        Video(title: "ANIME!!", videoURL: "https://firebasestorage.googleapis.com/v0/b/tiktokreels-443d9.appspot.com/o/anime.mp4?alt=media&token=8813c37c-134e-4408-9840-214f04941a27"),
//        Video(title: "POPUG", videoURL: "https://firebasestorage.googleapis.com/v0/b/tiktokreels-443d9.appspot.com/o/popug.mp4?alt=media&token=3a88524b-45ab-45d6-868d-ceb266dc0437"),
//        Video(title: "Dance challenge", videoURL: "https://firebasestorage.googleapis.com/v0/b/tiktokreels-443d9.appspot.com/o/dance.mp4?alt=media&token=2bc92862-0763-4e62-98df-b3ea54402df5"),
//        Video(title: "like", videoURL: "https://firebasestorage.googleapis.com/v0/b/tiktokreels-443d9.appspot.com/o/dirls.mp4?alt=media&token=80f66a24-1fbb-47f7-acaa-867587df5fcc")
    ]
    
    
    static let clips: [Clip] = [
    
    Clip(athor: Author(uid: "C4uUiXFvvwNr89Q73pu91C7a8xW2", avatarPath: "https://firebasestorage.googleapis.com/v0/b/tiktokreels-443d9.appspot.com/o/userAvatars%2FTiktok%20Cover.jpg?alt=media&token=e7b93307-81fe-476a-873d-16e85a253ad0", userName: "Tester"), sound: Soundtrack(imagePath: "", title: "Roddy Roundicch - The Rou"), description: "POPUG", videoUrl: "https://firebasestorage.googleapis.com/v0/b/tiktokreels-443d9.appspot.com/o/popug.mp4?alt=media&token=3a88524b-45ab-45d6-868d-ceb266dc0437", hashtags: [Hashtag(title: "funny"), Hashtag(title: "animals"), Hashtag(title: "cute")]),
    
    Clip(athor: Author(uid: "C4uUiXFvvwNr89Q73pu91C7a8xW2", avatarPath: "https://firebasestorage.googleapis.com/v0/b/tiktokreels-443d9.appspot.com/o/userAvatars%2FTiktok%20Cover.jpg?alt=media&token=e7b93307-81fe-476a-873d-16e85a253ad0", userName: "Tester"), sound: Soundtrack(imagePath: "https://firebasestorage.googleapis.com/v0/b/tiktokreels-443d9.appspot.com/o/userAvatars%2FTiktok%20Cover.jpg?alt=media&token=e7b93307-81fe-476a-873d-16e85a253ad0", title: "Interdance"), description: "Dance challenge", videoUrl: "https://firebasestorage.googleapis.com/v0/b/tiktokreels-443d9.appspot.com/o/dance.mp4?alt=media&token=2bc92862-0763-4e62-98df-b3ea54402df5", hashtags: [Hashtag(title: "shuffle"), Hashtag(title: "dance")]),
    
    Clip(athor: Author(uid: "C4uUiXFvvwNr89Q73pu91C7a8xW2", avatarPath: "https://firebasestorage.googleapis.com/v0/b/tiktokreels-443d9.appspot.com/o/userAvatars%2FTiktok%20Cover.jpg?alt=media&token=e7b93307-81fe-476a-873d-16e85a253ad0", userName: "Tester"), sound: Soundtrack(imagePath: "https://firebasestorage.googleapis.com/v0/b/tiktokreels-443d9.appspot.com/o/userAvatars%2FTiktok%20Cover.jpg?alt=media&token=e7b93307-81fe-476a-873d-16e85a253ad0", title: "Acmr_nice"), description: "Burgers 🍔🍔🍔", videoUrl: "https://firebasestorage.googleapis.com/v0/b/tiktokreels-443d9.appspot.com/o/food.mp4?alt=media&token=9713528e-07cd-4b04-af6c-6e6f4878983e", hashtags: [Hashtag(title: "food"), Hashtag(title: "burgers"), Hashtag(title: "spicy")])
    ]
}
