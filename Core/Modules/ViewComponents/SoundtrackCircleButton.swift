//
//  SoundtrackCircleButton.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 03.09.2022.
//

import SwiftUI

struct SoundtrackCircleButton: View {
    @State private var isAnimation: Bool = false
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
        }
        .onAppear{
            withAnimation(.linear(duration: 8).repeatForever(autoreverses: true)) {
                isAnimation = true
            }
        }
        .onDisappear{
            isAnimation = false
        }
    }
}

struct SoundtrackCircleButton_Previews: PreviewProvider {
    static var previews: some View {
        SoundtrackCircleButton()
    }
}
