////
//  ChatCell.swift
//  InstaProject
//
//  Created by OmerErbalta on 6.11.2023.
//

import SwiftUI
import Kingfisher

struct MessageBoxCell: View {
    var chat:Chat
    var user = User.MOCK_USER[0]
    init(chat:Chat) {
        self.chat = chat
        if let user = chat.user{
            self.user = user
            print(user.username)
        }
    }
    var body: some View {
        
        NavigationLink{
            ChatView(user: user,chat:chat)
            
        }label: {
            CircleProfileImage(user: user, size: .xsmall)
            VStack(alignment:.leading) {
                Text(user.username)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(chat.messages?.last?.message ?? "")
                    .opacity(0.4)
                
            }
            .foregroundStyle(.black)
            Spacer()
            Text("4h")
        
        }
        
        .padding(.trailing,30)
        .frame(width: Const.width)
        
    }
}
#Preview {
    MessageBoxCell(chat: Chat(id: "", usersId: []))
}
