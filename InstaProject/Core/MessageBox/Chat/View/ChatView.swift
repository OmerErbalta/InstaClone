//
//  Chat.swift
//  InstaProject
//
//  Created by OmerErbalta on 6.11.2023.
//

import SwiftUI
import Firebase
struct ChatView: View {
    @State var message = ""
    @State var user : User
    @State var messageList = [Message]()
    @StateObject var viewModel = ChatViewModel()

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
                            let sendedMessage = Message(id: UUID().uuidString, message:message, user:user.id)
                            messageList.append(sendedMessage)
                            Task{
                                try await viewModel.sendToMessage(user:user,message: message)
                                message = ""
                            }
                            
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
            }
            .frame(width: Const.width * 0.4)
            .padding(.trailing,Const.width * 0.15)
            NavigationLink{
                
            }label: {
                Image( systemName: "line.3.horizontal")
                    .foregroundStyle(.black)
            }
        }
        
    }
}

#Preview {
    ChatView(user: User.MOCK_USER[1])
}

