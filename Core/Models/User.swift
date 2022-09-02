//
//  User.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 01.09.2022.
//

import Foundation



struct User: Codable{
    let uid: String
    var email: String
    var profileImageUrl: String?
    var userName: String
    var description: String?
    
}
