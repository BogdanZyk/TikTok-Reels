//
//  Helpers.swift
//   TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 11.08.2022.
//

import Firebase
import SwiftUI

final class Helpers{
    
    
    static func handleError(_ error: Error?, title: String, errorMessage: inout String, showAlert: inout Bool){
        if let error = error {
            errorMessage = "\(title) \(error.localizedDescription)"
            showAlert = true
        }
    }
    
    static func preparingImageforUpload(_ image: UIImage?, compressionQuality: CGFloat = 1) -> Data?{
        guard let image = image, let imageData = image.jpegData(compressionQuality: compressionQuality) else {return nil}
        return imageData
    }
    
    static func uploadImageToFirestore(uiImage: UIImage?, imagePath: String, path: String, completion: @escaping (URL?, Error?) -> Void){
        guard let uiImage = uiImage else {
            completion(nil, nil)
            return
        }
        let ref = FirebaseManager.shared.storage.reference().child(path).child(imagePath)
        guard let imageData = preparingImageforUpload(uiImage) else {return}
        ref.putData(imageData, metadata: nil) {(metadate, error) in
            if let error = error{
                completion(nil, error)
            }
            ref.downloadURL {(url, error) in
                if let error = error{
                    completion(nil, error)
                    return
                }
                completion(url, nil)
            }
        }
    }
    

}
