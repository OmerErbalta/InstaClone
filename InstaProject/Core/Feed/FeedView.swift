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
                    ForEach(0...15,id:\.self){index in
                        FeedCell()
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
                    Text("Instagram").font(.title).fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
