//
//  FeedViewModle.swift
//  InstaProject
//
//  Created by OmerErbalta on 26.10.2023.
//

import Foundation
import Firebase
class FeedViewModel: ObservableObject{
    @Published var posts = [Post]()
    
    init() {
        Task{
            try await fetchPosts()
        }
    }
    @MainActor
    func fetchPosts()async throws{
        let snapShot = try await Firestore.firestore().collection("posts").order(by: "timeStap",descending: true).getDocuments()
      
        /*self.posts = try  snapShot.documents.compactMap({ document in
            let post = try document.data(as: Post.self)
            return post
        })*/
        //  ---->
        self.posts = try snapShot.documents.compactMap({try $0.data(as: Post.self)})
       
        for i in 0..<posts.count {
            let ownerUid = posts[i].ownerUuid
            let postUser = try await UserService.fetcUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        
    }
}
