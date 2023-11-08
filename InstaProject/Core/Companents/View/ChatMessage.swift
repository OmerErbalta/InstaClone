//
//  ChatMessage.swift
//  InstaProject
//
//  Created by OmerErbalta on 6.11.2023.
//

import SwiftUI
import Firebase

struct ChatMessage: View {
    @State var message:Message
    @State var messageType: messageType
    init(message: Message, messageType: messageType) {
        self.message = message
        self.messageType = messageType
    }
    
    var body: some View {
        VStack{
            Text(message.message)
                .padding()
                .background(Color(messageType.Color))
                .clipShape(BubbleShape(myMessage: messageType))
                .foregroundColor(.white)
            
            Text("4h")
                .opacity(0.4)
                .frame(alignment: .leading)
                
        }.frame(width: Const.width, alignment:messageType.alignment)
    }
}

#Preview {
    ChatMessage(message: Message(id: "", message: "deneme", user: ""), messageType: .myMessage)
}
enum messageType{
    case myMessage
    case otherMessage
    
    var Color : UIColor{
        switch self{
        case .myMessage:
            return UIColor(.blue)
        case .otherMessage:
            return UIColor(.gray)
        }
    }
    var alignment : Alignment{
        switch self {
        case .myMessage:
            return .trailing
        case .otherMessage:
            return .leading
        }
    }
    
        
}
