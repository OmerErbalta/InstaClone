//
//  PostService.swift
//  InstaProject
//
//  Created by OmerErbalta on 26.10.2023.
//

import Foundation
import Firebase
class PostService{
    private static let postCollection = Firestore.firestore().collection("posts")
    static func fetchFeedPost() async throws -> [Post]{
        let snapShot = try await postCollection.getDocuments()
      
        /*self.posts = try  snapShot.documents.compactMap({ document in
            let post = try document.data(as: Post.self)
            return post
        })*/
        //  ---->
        var posts = try snapShot.documents.compactMap({try $0.data(as: Post.self)})
        
        for i in 0..<posts.count {
            let ownerUid = posts[i].ownerUuid
            let postUser = try await UserService.fetcUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        
        return posts
    }
    static func fetchUserPost(uid:String) async throws -> [Post]{
        let snapshot = try await postCollection.whereField("ownerUuid", isEqualTo: uid).getDocuments()
        return  try snapshot.documents.compactMap({try $0.data(as:Post.self)})
    }
    
    static func fetchPost(uid:String) async throws -> Post{
        let snapshot = try await postCollection.document(uid).getDocument()
        return try snapshot.data(as: Post.self)
        
    }
}
