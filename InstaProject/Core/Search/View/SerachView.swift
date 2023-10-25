//
//  SerachView.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import SwiftUI

struct SerachView: View {
    @State private var  searchText = ""
    var body: some View {
        NavigationStack {
            ScrollView{
                //history users
                LazyVStack(spacing:15){
                    ForEach(User.MOCK_USER){user in
                        if user.email != AuthService.shared.userSession?.email{
                            //user
                            NavigationLink{
                                ProfileView(user: user, userView: .CurrentUserView, posts: Post.MOCK_POSTS)
                            }label: {
                            label: do {
                                HStack(){
                                    Image(user.profileImageUrl ?? "")
                                        .resizable()
                                        .frame(width: 40,height: 40)
                                        .clipShape(.circle)
                                        .opacity(0.9)
                                    
                                    VStack (alignment:.leading){
                                        Text(user.username).fontWeight(.semibold).opacity(0.85)
                                        
                                        if let fullnName = user.fullName {
                                            Text(fullnName).font(.footnote).opacity(0.7)
                                        }
                                    }
                                }
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .foregroundStyle(.black)
                                .padding(.leading,8)
                            }
                            }
                        }
                    }
                    
                }
                .padding(.top,15)
                .searchable(text: $searchText,prompt: "Search...")
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    SerachView()
}
