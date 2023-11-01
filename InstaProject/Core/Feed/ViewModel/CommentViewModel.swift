//
//  CommentViewModel.swift
//  InstaProject
//
//  Created by OmerErbalta on 1.11.2023.
//
import Foundation
import Firebase
class CommentViewModel:ObservableObject{
    let post : Post
    @Published var comments = [Comment]()
     
    init(post: Post) {
        self.post = post
        Task{
            try await fetchComments(postId: post.id)
        }
    }
    
    @MainActor
    func fetchComments(postId:String)  async throws{
        let snapShot = try await Firestore.firestore().collection("posts").document(postId).collection("comment").order(by: "timeStap",descending: true).getDocuments()
        
        self.comments = try  snapShot.documents.compactMap({try $0.data(as: Comment.self)})
        
        for i in 0..<comments.count {
            let userId = comments[i].userId
            let commentUser = try await UserService.fetcUser(withUid: userId)
            self.comments[i].user = commentUser
            
        }
    }
    
    func addComment(post:Post,commentString:String) async throws {
         let userId = AuthService.shared.currentUser?.id
        let commentRef = Firestore.firestore().collection("posts").document(post.id).collection("comment").document()
        let comment = Comment(id: commentRef.documentID, comment: commentString, timeStap: Timestamp(), userId: userId ?? "")
        guard let encoderComment = try? Firestore.Encoder().encode(comment) else{return}
        try await commentRef.setData(encoderComment)
        
    }
}
