//
//  CommentBottomSheet.swift
//  InstaProject
//
//  Created by OmerErbalta on 31.10.2023.
//

import SwiftUI

struct CommentBottomSheet: View {
    @StateObject var viewModel : CommentViewModel
    init(post: Post) {
        self._viewModel = StateObject(wrappedValue: CommentViewModel(post:post))
        
    }
    var body: some View {
        ScrollView{
            VStack{
                ForEach(viewModel.comments){comment in
                    if comment.user != nil{
                        CommentView(comment: comment)
                    }
                }
                
               /* ForEach(0..<10){index in
                    CommentView(comment: Comment.MOCK_COMMENT[0])
                }*/
                 
            }
            .padding(.all,20)
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
                    VStack(alignment:.leading,spacing: 5) {
                        HStack() {
                            Text(user.username)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text(ExtencionsClass.calculateTimeDifference(date: comment.timeStap))
                                .opacity(0.4)
                                .font(.footnote)
                                .fontWeight(.semibold)
                        }
                        Text(comment.comment)
                            .font(.caption)
                            .fontWeight(.medium)
                            .frame(width: Const.width * 0.7)
                            
                            
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
