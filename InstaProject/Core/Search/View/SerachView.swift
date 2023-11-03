//
//  SerachView.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import SwiftUI

struct SerachView: View {
    @State private var  searchText = ""
    @StateObject var viewModel = SerachViewModel()
    @StateObject var contentViewModel = ContentViewModel()
    var body: some View {
        NavigationStack {
            ScrollView{
                //history users
                LazyVStack(spacing:15){
                    ForEach(viewModel.users){user in
                        //user
                        if user.email != contentViewModel.currentUser?.email{
                            
                            NavigationLink{
                                
                                ProfileView(user: user)
                                
                            }label: {
                            label: do {
                                HStack(){
                                    CircleProfileImage(user: user, size: .small)
                                    
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
