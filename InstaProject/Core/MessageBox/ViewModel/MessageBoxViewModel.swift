//
//  MessageBoxViewModel.swift
//  InstaProject
//
//  Created by OmerErbalta on 8.11.2023.
//

import Foundation
import Firebase
@MainActor
class MessageBoxViewModel : ObservableObject{
    
    @Published var chatList = [Chat]()
    
    init() {
        Task{
            try await fetchAllMessage()
        }
    }
    func fetchAllMessage() async throws{
        guard let currentUser = AuthService.shared.currentUser else{return}
        if let chatListId = currentUser.chatListId{
            for i in 0..<(chatListId.count){
                var chat :Chat
              let snapShot = try await Firestore.firestore().collection("chat").document(chatListId[i]).getDocument()
                chat = try snapShot.data(as: Chat.self)
                let messageSnapshot = try await Firestore.firestore().collection("chat").document(chat.id).collection("messages").getDocuments()
                chat.messages = try messageSnapshot.documents.compactMap({try $0.data(as: Message.self)})
                self.chatList.append(chat)
            }
        }
        
        try await addedUsersChat(currentUser: currentUser)
    }
    
    func getChatFromUserId(user:User) -> Chat{
        var chat = Chat(id: "", usersId: [])
        for i in 0..<chatList.count{
            if user.id == chatList[i].user?.id
            {
                chat = chatList[i]
            }
        }
        return chat
    }
    func addedUsersChat(currentUser:User) async throws{
        for i in 0..<chatList.count {
            var userId :String
            if currentUser.id == chatList[i].usersId?[0] {
                userId = chatList[i].usersId![1]
            }
            else{
                userId = chatList[i].usersId![0]
            }
            let user = try await UserService.fetcUser(withUid: userId)
            print(user.username)
            chatList[i].user = user
        }
    }
}
