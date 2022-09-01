//
//  UserDataService.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 01.09.2022.
//

import Foundation
import FirebaseFirestoreSwift

protocol UserDataServiceProtocol{
    
    func createAccount(email: String, password: String, username: String, completion: @escaping (Result<Bool, Error>) -> Void)
    
    func storeUserInformation(email: String, userName: String, completion: @escaping (Result<Bool, Error>) -> Void)
    
    func logIn(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void)
    
    func logOut(completion: @escaping () -> Void)
}


final class UserDataService: UserDataServiceProtocol {
    
    
    func logIn(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void){
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) {(result, error) in
            if let error = error{
                completion(.failure(error))
                return
            }
            completion(.success(result?.user.uid != nil))
        }
    }
    
    func createAccount(email: String, password: String, username: String, completion: @escaping (Result<Bool, Error>) -> Void){
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) {[weak self] (result, error) in
            if let error = error{
                completion(.failure(error))
                return
            }
            self?.storeUserInformation(email: email, userName: username, completion: completion)
        }
    }
    
    func storeUserInformation(email: String, userName: String, completion: @escaping (Result<Bool, Error>) -> Void){
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {return}
        let user = User(uid: uid, email: email, profileImageUrl: "", userName: userName)
        do {
            try  FirebaseManager.shared.firestore.collection("users")
                .document(uid)
                .setData(from: user, completion: { error in
                    if let error = error{
                        completion(.failure(error))
                        return
                    }
                    completion(.success(true))
                })
        } catch {
            completion(.failure(error))
        }
    }
    
    
    
    func updateUserInformation(userName: String, profileImageUrl: URL?, completion: @escaping (Error?) -> Void){
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {return}
        let userRef = FirebaseManager.shared.firestore.collection("users").document(uid)
        userRef.updateData([
            "userName" : userName,
            "profileImageUrl": profileImageUrl?.absoluteString ?? ""
                           ]) { error in
            completion(error)
        }
    }
    
    func logOut(completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            try? FirebaseManager.shared.auth.signOut()
            completion()
        }
    }
   
}
