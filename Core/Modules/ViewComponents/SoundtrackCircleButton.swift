//
//  SoundtrackCircleButton.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 03.09.2022.
//

import SwiftUI

struct SoundtrackCircleButton: View {
    var isAnimation: Bool
    var soundtrack: Soundtrack?
    var body: some View {
        
        Button {
            
        } label: {
            ZStack{
                Color.black.opacity(0.8)
                if let soundtrack = soundtrack?.imagePath {
                    CustomLazyImage(strUrl: soundtrack)
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                }
            }
            .frame(width: 47, height: 47)
            .clipShape(Circle())
            .rotationEffect(.degrees(isAnimation ? 360 : 0))
            .animation(.linear(duration: 7).repeatForever(autoreverses: false), value: isAnimation)
        }
    }
}

struct SoundtrackCircleButton_Previews: PreviewProvider {
    static var previews: some View {
        SoundtrackCircleButton(isAnimation: true)
    }
}
