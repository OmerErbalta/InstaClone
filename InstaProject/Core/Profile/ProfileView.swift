//
//  ProfileView.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import SwiftUI

struct ProfileView: View {
    private let gridItems :[GridItem] = [
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1)
        
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    
                    //header
                    UserHeaderView()
                    
                    //action Button
                    Button(action: {
                        
                    }, label: {
                        Text("Edit Profile")
                    })
                    .frame(width:Const.width * 0.9,height: 35 )
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray,lineWidth: 1))
                    .padding(.horizontal)
                    
                    Divider()
                    
                    //post gridView
                    VStack{
                        LazyVGrid(columns : gridItems,spacing: 1){
                            ForEach(0...20 ,id: \.self){ index in
                                Image("profilePhoto")
                                    .resizable()
                                    .scaledToFill()
                            }
                            
                        }
                        
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem( placement: .topBarTrailing) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    })
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}

struct UserHeaderView: View {
    var body: some View {
        VStack(alignment:.leading){
            //pic and stats
            HStack(alignment:.center){
                Image("profilePhoto")
                    .resizable()
                    .scaledToFill()
                    .frame(width:80,height:80)
                    .clipShape(.circle)
                UserStatView(value: 6, title: "Posts")
                UserStatView(value: 10, title: "Followers")
                UserStatView(value: 20, title: "Following")
                
            }
            
            
            //name and bio
            VStack(alignment:.leading){
                Text("Ömer Erbalta").font(.subheadline).fontWeight(.bold)
                Text("IOS Developer").fontWeight(.medium).font(.footnote)
                
            }
            .padding(.horizontal,8)
            .frame(width: Const.width,alignment: .leading)
            
        }
    }
}
