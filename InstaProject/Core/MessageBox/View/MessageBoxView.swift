//
//  ChatView.swift
//  InstaProject
//
//  Created by OmerErbalta on 6.11.2023.
//

import SwiftUI

struct MessageBoxView: View {
    @EnvironmentObject var viewSwitch: ViewSwitch
    @StateObject var viewModel = MessageBoxViewModel()
    var body: some View {
        NavigationStack{
                ScrollView{
                    ForEach (viewModel.chatList ){ chat in
                        MessageBoxCell(chat:chat)
                        Divider()
                    }
                }
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        
                        Button(action: {
                            withAnimation(Animation.easeInOut(duration: 0.2)) {
                                viewSwitch.changeRootView(to: .Tabbed)
                                
                            }
                        }, label: {
                            Image(systemName: "chevron.backward")
                                .foregroundStyle(.black)
                        })
                    }
                    ToolbarItem(placement:.automatic) {
                        Text("Message Box")
                            .font(.title).fontWeight(.bold)
                            .frame(width: Const.width * 0.5)
                            .padding(.trailing, Const.width * 0.2)
                        
                        
                    }
                }
            }
    }
}

#Preview {
    MessageBoxView()
}
