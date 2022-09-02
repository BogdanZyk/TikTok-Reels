//
//  ClipDataService.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 03.09.2022.
//

import Foundation


final class ClipDataService{
    
    @Published var allClips: [Clip] = []
    @Published var error: Error?
    
    init(){
        fetchAllClips()
    }
    
    func fetchAllClips(){
        FirebaseManager.shared.firestore
            .collection(FbConstants.All_CLIPS)
            .getDocuments {[weak self] (documentSnapshot, error) in
                guard let self = self else {return}
                
                if let error = error {
                    self.error = error
                    return
                }
                documentSnapshot?.documents.forEach({ snapshot in
                    do{
                        let returnedVideo = try snapshot.data(as: Clip.self)
                        self.allClips.append(returnedVideo)
                    }catch{
                        self.error = error
                    }
                })
            }
    }
    
    
}
