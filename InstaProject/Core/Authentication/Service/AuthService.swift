//
//  AuthService.swift
//  InstaProject
//
//  Created by OmerErbalta on 23.10.2023.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift

class AuthService {
    @Published var userSession :FirebaseAuth.User?
    @Published var currentUser : User?
    static let shared = AuthService()
    init() {
        Task{
            try await loadUserData()
        }
    }
    
    @MainActor
    func login(withEmail email:String , password:String)async throws{
        
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        }catch{
            print("Debug failed to Log in user  \(error.localizedDescription)")
        }
    }
    @MainActor
    func createUser(email:String,password:String,username:String)async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("Debug did create user")
            await uploadUserData(uid: result.user.uid,email: email,username: username,password: password)
            
            print("Debug did upload user data")
        }catch{
            print("Debug failed to register user  \(error.localizedDescription)")
        }

    }
    @MainActor
    func loadUserData()async throws{
        self.userSession = Auth.auth().currentUser
        guard let currentUid = self.userSession?.uid else {return }
        self.currentUser = try await UserService.fetcUser(withUid: currentUid)
         
    }
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    private func uploadUserData(uid : String,email:String,username:String,password:String) async{
        let user = User(id: uid, email: email, username: username, password: password)
        self.currentUser = user
        guard let enCodeUser = try? Firestore.Encoder().encode(user) else{ return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(enCodeUser)
    }
}
