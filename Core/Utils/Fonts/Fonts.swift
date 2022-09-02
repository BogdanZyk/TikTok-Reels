//
//  Fonts.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 03.09.2022.
//

import SwiftUI


extension Font {
    static func proximaRegular(size: Int) -> Font {
        Font.custom("ProximaNova-Regular", size: CGFloat(size))
    }
    static func proximaBold(size: Int) -> Font {
        Font.custom("ProximaNova-Bold", size: CGFloat(size))
    }
    
    static func proximaSemibold(size: Int) -> Font {
        Font.custom("ProximaNova-Semibold", size: CGFloat(size))
    }


}
