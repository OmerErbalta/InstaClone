//
//  CommentBottomSheet.swift
//  InstaProject
//
//  Created by OmerErbalta on 31.10.2023.
//

import SwiftUI

struct CommentBottomSheet: View {
    @StateObject var viewModel : CommentViewModel
    @State var commentText = ""
    @State var post : Post
    init(post: Post) {
        self.post = post
        self._viewModel = StateObject(wrappedValue: CommentViewModel(post:post))
    }
    var body: some View {
        VStack {
            ScrollView{
                VStack{
                    ForEach(viewModel.comments){comment in
                        if comment.user != nil{
                            CommentView(comment: comment)
                        }
                    }
                    /*
                    ForEach(0..<10){index in
                        CommentView(comment: Comment.MOCK_COMMENT[0])
                    }*/
                     
                }
                .padding(.all,20)
            }
            HStack{
                TextField("Add Commit...", text: $commentText)
                    .modifier(IGTextFieldModifier())
                Button(action: {
                    Task{
                       try await viewModel.addComment(post:self.post,commentString:commentText)
                        commentText = ""
                       try await viewModel.fetchComments(postId: self.post.id)
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
}

struct CommentView:View {
    @State var comment : Comment
    @State var diffrenceTime : String
    init(comment:Comment) {
        self.comment = comment
        self.diffrenceTime = ExtencionsClass.calculateTimeDifference(date:comment.timeStap )
    }
    var body: some View {
        HStack (alignment:.top){
            if let user = comment.user{
                HStack {
                    CircleProfileImage(user: user, size: .xsmall)
                    VStack(alignment:.leading,spacing: 3) {
                        HStack() {
                            Text(user.username)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text(ExtencionsClass.calculateTimeDifference(date: comment.timeStap))
                                .opacity(0.4)
                                .font(.footnote)
                                .fontWeight(.semibold)
                        }
                        .padding(.bottom,5)
                        Text(comment.comment)

                            .font(.caption)
                            .fontWeight(.regular)
                            .frame(alignment: .leading)
                            
                            
                        
                            
                    }
                    Spacer()
                    Image(systemName: "heart")
                    
                }
            }
        }
        .padding(.all,20)
        .background(.opacity(0.05))
        .clipShape(.rect(cornerRadius: 30))
    
    
    }
}

#Preview {
    CommentBottomSheet(post: Post.MOCK_POSTS[0])
}
