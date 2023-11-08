//
//  Chat.swift
//  InstaProject
//
//  Created by OmerErbalta on 6.11.2023.
//

import SwiftUI

struct Chat: View {
    @State var message = ""
    @State var user : User
    @State var messageList = [Message]()
    init(user:User) {
        self.user = user
    }
    var body: some View {
        NavigationStack {
            VStack{
                ScrollView{
                    ForEach(messageList ,id: \.id){message in
                        ChatMessage(message: message, messageType: .myMessage)
                       
                    }
                }
                HStack {
                 
                        TextField("Type in your Text here...", text: $message)
                            .modifier(TextFieldClear(text: $message))
                            .modifier(IGTextFieldModifier())
                            .multilineTextAlignment(.leading)
                    Button(action: {
                        if message != ""{
                            messageList.append(Message(id: UUID().uuidString, message:message, user: user.id))
                            message = ""
                        }
                       
                        
                        
                    }, label: {
                        Image(systemName: "paperplane.circle.fill")
                            .resizable()
                            .frame(width: 30,height: 30)
                            .padding(.trailing,10)
                            
                    })
                            
                                   
                }
            }
        }
        .toolbar{
            NavigationLink{
                ProfileView(user: user)
            }label: {
                CircleProfileImage(user: user, size: .xxsmall)
                VStack(alignment:.leading) {
                    Text(user.username)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                }
                .foregroundStyle(.black)
            }.padding(.trailing,Const.width * 0.1)
            NavigationLink{
                
            }label: {
                Image( systemName: "line.3.horizontal")
                    .foregroundStyle(.black)
            }
        }
        
    }
}

#Preview {
    Chat(user: User.MOCK_USER[1])
}

