//
//  PostGridView.swift
//  InstaProject
//
//  Created by OmerErbalta on 23.10.2023.
//

import SwiftUI

struct PostGridView: View {
    var user : User
    
    private let gridItems :[GridItem] = [
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1)
        
    ]
    var body: some View {
        VStack{
            LazyVGrid(columns : gridItems,spacing: 1){
                ForEach(posts,id:\.id ){ post in
                    Image(post.ımageUrl)
                        .resizable()
                        .scaledToFill()
                        .clipped()
                }
                
            }
            
        }
    }
}

#Preview {
    PostGridView(user: User.MOCK_USER.first!)
}
