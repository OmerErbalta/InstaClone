//
//  ProfileHeaderView.swift
//  InstaProject
//
//  Created by OmerErbalta on 23.10.2023.
//

import SwiftUI


struct ProfileHeaderView: View {
    let user : User
    @State var showEditProfile = false
    let userView : Const.UsersView
    var body: some View {
        VStack(alignment:.leading){
            //pic and stats
            HStack(alignment:.center){
                CircleProfileImage(user: user,size: .medium)
                UserStatView(value: 0, title: "Posts")
                UserStatView(value: user.fallower, title: "Followers")
                UserStatView(value: user.fallowing, title: "Following")
                
            }
            
            
            //name and bio
            VStack(alignment:.leading){
                Text(user.username).font(.subheadline).fontWeight(.bold)
                if let fullName = user.fullName{
                    Text(fullName ).font(.footnote).fontWeight(.semibold)
                }
                if let bio = user.bio{
                    Text(bio).fontWeight(.medium).font(.footnote)
                }
                
            }
            .padding(.horizontal,8)
            .frame(width: Const.width,alignment: .leading)
            
            //action Button
            Button(action: {
                if userView == .UserView{
                    showEditProfile.toggle()
                }
                else if userView == .OthherProfileView{
                    
                }
            }, label: {
                Text(userView  == .UserView ? "Edit Profile" : "Fallow")
            })
            .frame(width:Const.width * 0.9,height: 35 )
            .fontWeight(.semibold)
            .foregroundStyle(userView == .UserView ? .black : .white)
            .background(userView == .UserView ? .white : Color(.systemBlue))
            .clipShape(.rect(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(userView == .UserView ? .gray : .clear ,lineWidth: 1))
            .padding(.horizontal)
        }
        .fullScreenCover(isPresented: $showEditProfile){
            EditProfileView(user: user)
        }
        Divider()
    }
       
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USER.first!, userView: .UserView)
}
