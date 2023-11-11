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

@MainActor
class ChatViewModel : ObservableObject{
    @Published var chat : Chat?
    
  
   
    func sendToMessage(user:User,message:String)async throws{
        print("send to message")
        guard let currentUser = AuthService.shared.currentUser else{return}
        try await checkChat(user: user,currectUser: currentUser)
        guard let chat = self.chat else{return}
        let chatRef = Firestore.firestore().collection("chat").document(chat.id)
        try await addMessage(messageValue: message, currectUser: currentUser, chatRef: chatRef)
    }
    
    func addChatList(user:User,chatId:String) async throws{
        print("add chat list")
        var data = [String:Any]()
        let ref = Firestore.firestore().collection("users").document(user.id)
        var chatList = user.chatListId ?? []
        chatList.append(chatId)
        data["chatListId"] = chatList
        try await ref.updateData(data)
    }
    
    
    func addMessage(messageValue:String, currectUser:User,chatRef:DocumentReference) async throws{
        print("add message")
        let messageRef = chatRef.collection("messages").document()
        let message = Message(id: messageRef.documentID, message: messageValue, user: currectUser.id)
        guard let encodeMessage = try? Firestore.Encoder().encode(message) else{return}
        try await messageRef.setData(encodeMessage)
        
    }
    
    func fetchChatList(user:User)async throws -> [Chat] {
        var chatList = [Chat]()
        if let chatListId = user.chatListId{
            for i in 0..<(chatListId.count){
              let snapShot = try await Firestore.firestore().collection("chat").document(chatListId[i]).getDocument()
                chatList.append(try snapShot.data(as: Chat.self))
            }
        }
        return chatList
    }
    func checkChat(user:User,currectUser:User)async throws{
        let userChatList = try await fetchChatList(user: currectUser)
        var check = false
        print("check Chat")
            for i in 0..<userChatList.count{
                if userChatList[i].usersId!.contains(user.id){
                    check = true
                    self.chat = userChatList[i]
                }
            }
        
        if check == false {try await createChat(senderUser: user, currectUser: currectUser)}
    }
    func createChat(senderUser:User,currectUser:User) async throws {
        print("createChat")
        let chatRef = Firestore.firestore().collection("chat").document()
        let chat = Chat(id: chatRef.documentID ,usersId:[senderUser.id,currectUser.id])
        guard let encoderChat = try? Firestore.Encoder().encode(chat) else{return}
       try await chatRef.setData(encoderChat)
        self.chat = chat
        try await addChatList(user: senderUser, chatId: chat.id)
        try await addChatList(user: currectUser, chatId: chat.id)
        AuthService.shared.currentUser?.chatListId?.append(chat.id)
    }
    
    
}
