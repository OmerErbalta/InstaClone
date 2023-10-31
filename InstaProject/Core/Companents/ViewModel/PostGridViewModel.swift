//
//  PostGridViewModel.swift
//  InstaProject
//
//  Created by OmerErbalta on 26.10.2023.
//

import Foundation

class PostGridViewModel:ObservableObject{
    private let user : User
    @Published var posts = [Post]()
    init(user:User){
        self.user = user
        Task{
            try await fetchUserPosts()
        }
    }
    
    @MainActor
    func fetchUserPosts() async throws{
        self.posts = try await PostService.fetchUserPost(uid: user.id)
        for i in 0..<self.posts.count {
            self.posts[i].user = self.user
        }
    }
}
