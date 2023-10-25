//
//  ProfileView.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import SwiftUI

struct ProfileView: View {
    var user : User
    let userView : Const.UsersView
    @State var posts : [Post]
    init(user: User, userView: Const.UsersView, posts: [Post]) {
        self.user = user
        self.userView = userView
        self.posts = Post.MOCK_POSTS.filter({$0.user?.username == user.username})
    }
    
   
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    
                    //header
                    ProfileHeaderView(user: user,userView : self.userView)
                    
                    Divider()
                    
                    //post gridView
                    PostGridView(posts:posts)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                if userView == .UserView{
                    ToolbarItem( placement: .topBarTrailing) {
                        Button(action: {
                            AuthService.shared.signOut()
                        }, label: {
                            Image( systemName: "line.3.horizontal")
                                .foregroundStyle(.black)
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView(user: User.MOCK_USER.first!, userView: .UserView, posts: [Post.MOCK_POSTS.first!])
}

