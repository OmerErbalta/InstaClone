//
//  FeedCell.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import SwiftUI
import Kingfisher
struct FeedCell: View {
    @StateObject var viewModel = FeedCellViewModel()
    @StateObject var contentViewModel = ContentViewModel()
    @State var post : Post
    @State var postLiked :Bool
    init(post:Post) {
        self.post = post
        self.postLiked = FeedCellViewModel().checkPostLiked(post: post)
    }
    var body: some View {
        VStack{
            //User Info
            HStack{
                if let user = post.user{
                    CircleProfileImage(user: user, size: .xsmall)
                    VStack(alignment:.leading) {
                        Text(user.username)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text(user.fullName ?? "")
                            .font(.callout)
                            .foregroundStyle(.black)
                            .opacity(0.4)
                        
                    }
                }
                
                Spacer()
                
            }.padding(.leading,10)
            //Post
            KFImage(URL(string: post.ımageUrl))
                .resizable()
                .frame(width: Const.width , height: Const.height * 0.4)
                .scaledToFill()
                .clipShape(Rectangle())
            
            
            // action buttons
            HStack(spacing:15){
                Button(action: {
                    Task{
                        if let userId = AuthService.shared.currentUser?.id {
                            (post:self.post,liked:postLiked) =  try await viewModel.likedPost(post: post, userId:userId)
                        }
                    }
                }, label: {
                    if postLiked{
                        Image(systemName: "heart.fill")
                            .imageScale(.large)
                            .foregroundStyle(.red)
                    }
                    else{
                        Image(systemName: "heart")
                            .imageScale(.large)
                            
                    }
                   
                    
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
            Text("\(post.likedList?.count ?? 0) likes")
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
