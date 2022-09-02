//
//  UserAvatarViewComponent.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 03.09.2022.
//

import SwiftUI

struct UserAvatarViewComponent: View {
    let pathImage: String?
    var size: CGSize = .init(width: 37, height: 37)
    var body: some View {
        Group{
            if let image = pathImage{
                CustomLazyImage(strUrl: image)
            }else{
                ZStack{
                    Color.gray
                }
            }
        }
        .frame(width: size.width, height: size.height)
        .clipShape(Circle())
    }
}

struct UserAvatarViewComponent_Previews: PreviewProvider {
    static var previews: some View {
        UserAvatarViewComponent(pathImage: nil)
    }
}
