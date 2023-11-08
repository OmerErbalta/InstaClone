//
//  ChatView.swift
//  InstaProject
//
//  Created by OmerErbalta on 6.11.2023.
//

import SwiftUI

struct MessageBoxView: View {
    @EnvironmentObject var viewSwitch: ViewSwitch
    var body: some View {
        //
        
        NavigationStack{
                ScrollView{
                    ForEach (0..<10 ){ i in
                        MessageBoxCell()
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
