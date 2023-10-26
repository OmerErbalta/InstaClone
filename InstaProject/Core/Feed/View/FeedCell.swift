//
//  FeedCell.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import SwiftUI

struct FeedCell: View {
    let post : Post
    var body: some View {
        VStack{
            //User Info
            HStack{
                if let user = post.user{
                    CircleProfileImage(user: user, size: .small)
                    VStack(alignment:.leading) {
                        Text(post.user?.username ?? "User")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text(post.user?.fullName ?? "fullname")
                            .font(.callout)
                            .foregroundStyle(.black)
                            .opacity(0.4)
                        
                    }
                }
                
                Spacer()
                
            }.padding(.leading,10)
            //Post
            Image(post.ımageUrl)
                .resizable()
                .frame(width: Const.width , height: Const.height * 0.4)
                .scaledToFill()
                .clipShape(Rectangle())
            
            
            // action buttons
            HStack(spacing:15){
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                })
                Button(action: {}, label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                })
                Spacer()
            }
            .padding(.leading,10)
            .foregroundStyle(.black)

            //like label
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,8)
                .padding(.top,2)
            // caption label
            
            HStack {
                Text((post.user?.username)  ?? "User" )
                    .fontWeight(.semibold) +
                Text(post.caption)
            }.frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,8)
                .font(.footnote)
                .padding(.top,2)
                
            Text("4h").font(.footnote).opacity(0.5)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
            
        }
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POSTS[1])
}
