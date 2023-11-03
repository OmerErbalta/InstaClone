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
    @State var diffrenceTime:String
    @State private var showingComment = false
    init(post:Post) {
        self.post = post
        self.postLiked = FeedCellViewModel().checkPostLiked(post: post)
        self.diffrenceTime = ExtencionsClass.calculateTimeDifference(date: post.timeStap)
        
    }
    var body: some View {
        
        VStack{
            //User Info
            HStack{
                if let user = post.user{
                    NavigationLink{
                        ProfileView(user: user)
                    }label: {
                        CircleProfileImage(user: user, size: .xsmall)
                        VStack(alignment:.leading) {
                            Text(user.username)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text(user.fullName ?? "")
                                .font(.callout)
                                .opacity(0.4)
                            
                        }
                        .foregroundStyle(.black)
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
                VStack{
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
                    Text("\(post.likedList?.count ?? 0)")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                VStack{
                    Button(action: {
                        showingComment = true
                        
                    }, label: {
                        Image(systemName: "bubble.right")
                            .imageScale(.large)
                       
                    })
                    .sheet(isPresented: $showingComment) {
                        CommentBottomSheet(post: post)
                            .presentationDetents([.large,.medium])
                    }
                    
                    Text("\(post.commentCount ?? 0)")
                        .font(.footnote)
                        .fontWeight(.semibold)
                       
                }
                Button(action: {}, label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                })
                Spacer()
            }
            .padding(.leading,10)
            .foregroundStyle(.black)

            //like label
           
            // caption label
            
            HStack {
                Text((post.user?.username)  ?? "User" )
                    .fontWeight(.semibold) +
                Text(post.caption)
            }.frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,8)
                .font(.footnote)
                .padding(.top,2)
                
            Text(diffrenceTime ).font(.footnote).opacity(0.5)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
            
        }
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POSTS[1])
}
