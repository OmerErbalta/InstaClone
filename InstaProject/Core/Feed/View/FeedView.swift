//
//  FeedView.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                //Post List
                
                LazyVStack(spacing:20) {
                    ForEach(Post.MOCK_POSTS ,id: \.id){post in
                        FeedCell(post:post)
                    }
                    .padding(.top,30)
                }
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "paperplane")
                            .foregroundStyle(.black)
                    })
                }
                ToolbarItem(placement: .topBarLeading) {
                    Text("Erbalta").font(.title).fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
