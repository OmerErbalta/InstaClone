//
//  FeedView.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    @EnvironmentObject var viewSwitch: ViewSwitch

    var body: some View {
        NavigationStack {
            ScrollView{
                //Post List
                VStack(spacing:20) {
                    ForEach(viewModel.posts){post in
                        if post.user != nil {
                            FeedCell(post: post)
                        }
                    }
                    
                    .padding(.top,30)
                }
            }
            .refreshable {
                Task{
                    try await viewModel.fetchPosts()
                }
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        withAnimation(Animation.easeInOut(duration: 0.2)) {
                        viewSwitch.changeRootView(to: .WithoutTabbed)
                        }
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


