//
//  ChatCell.swift
//  InstaProject
//
//  Created by OmerErbalta on 6.11.2023.
//

import SwiftUI
import Kingfisher

struct MessageBoxCell: View {
    var user = User.MOCK_USER[2]
    var body: some View {
        
        NavigationLink{
            ProfileView(user: user)
        }label: {
            Image("personImage")
                .resizable()
                .frame(width: 70,height: 70)
            VStack(alignment:.leading) {
                Text(user.username)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("Last message bla bla bla bla bla bla")
                    .font(.callout)
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
    MessageBoxCell()
}
