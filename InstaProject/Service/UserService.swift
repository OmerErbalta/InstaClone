//
//  UserService.swift
//  InstaProject
//
//  Created by OmerErbalta on 25.10.2023.
//

import Foundation
import Firebase
struct UserService{
    
    static func fetcUser(withUid uid:String) async throws -> User{
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
        
    }
    
    
   static func fetchAllUsers() async throws -> [User]{
      let snapshot = try await  Firestore.firestore().collection("users").getDocuments()
       return snapshot.documents.compactMap({try? $0.data(as:User.self)})
       
    }
}
