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
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    
                    //header
                    ProfileHeaderView(user: user,userView : self.userView)
                    
                    Divider()
                    
                    //post gridView
                    PostGridView(user:user)
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
    ProfileView(user: User.MOCK_USER.first!, userView: .UserView)
}

