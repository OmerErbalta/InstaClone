//
//  ProfileView.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import SwiftUI

struct ProfileView: View {
    var user : User
    @EnvironmentObject var viewSwitch: ViewSwitch
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    
                    //header
                    ProfileHeaderView(user: user)
                        .environmentObject(viewSwitch)
                    
                    Divider()
                    
                    //post gridView
                    PostGridView(user:user)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                    ToolbarItem( placement: .topBarTrailing) {
                        Button(action: {
                            if self.user.id == AuthService.shared.currentUser?.id{
                                AuthService.shared.signOut()
                            }
                            else{
                                print("other profile View ")
                            }
                           
                        }, label: {
                            Image( systemName: "line.3.horizontal")
                                .foregroundStyle(.black)
                        })
                    }
                
            }
        }
    }
}

#Preview {
    ProfileView(user: User.MOCK_USER.first!)
}

