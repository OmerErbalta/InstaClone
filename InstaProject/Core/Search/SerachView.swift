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
                //search bar
                
                
                
                //history users
                LazyVStack(spacing:15){
                    ForEach(0...15,id:\.self){user in
                        
                        //user
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            HStack(){
                                Image("profilePhoto")
                                    .resizable()
                                    .frame(width: 40,height: 40)
                                    .clipShape(.circle)
                                    .opacity(0.9)
                                    
                                VStack (alignment:.leading){
                                    Text("Ömer Erbalta").fontWeight(.semibold).opacity(0.85)
                                    Text("omerErbalta1903").font(.footnote).opacity(0.7)
                                }
                            }
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .foregroundStyle(.black)
                            .padding(.leading,8)
                        })
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
