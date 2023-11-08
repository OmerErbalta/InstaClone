//
//  ChatViewModel.swift
//  InstaProject
//
//  Created by OmerErbalta on 8.11.2023.
//

import Foundation
import Firebase
import FirebaseFirestore
import SwiftUI


class ChatViewModel : ObservableObject{
    @Published var chat : Chat?
    
    func createChat(senderUser:User,currectUser:User) async throws {
        let chatRef = Firestore.firestore().collection("messages").document()
        let chat = Chat(id: chatRef.documentID, usersId:[senderUser.id,currectUser.id])
        guard let encoderChat = try? Firestore.Encoder().encode(chat) else{return}
        try await chatRef.setData(encoderChat)
        self.chat = chat
    }
    func addMessage(messageValue:String, currectUser:User,chatRef:DocumentReference) async throws{
        let messageRef = chatRef.collection("messages").document()
        let message = Message(id: messageRef.documentID, message: messageValue, user: currectUser.id)
        guard let encodeMessage = try? Firestore.Encoder().encode(message) else{return}
        try await messageRef.setData(encodeMessage)
        
    }
    func sendToMessage(user:User,message:String){
        
    }
    
    func checkChat(user:User,messageValue:String)async throws{
        guard let currectUser = AuthService.shared.currentUser else{return}
        
        if let chatList = currectUser.chatList{
            for i in 0..<chatList.count{
                if chatList[i].usersId.contains(user.id){
                    self.chat = chatList[i]
                }
                else{
                    try await createChat(senderUser: user, currectUser: currectUser)
                }
            }
        }
        else{
            try await createChat(senderUser: user, currectUser: currectUser)
        }

        
    }
    
}
