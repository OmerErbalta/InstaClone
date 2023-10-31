//
//  FeedCellViewModel.swift
//  InstaProject
//
//  Created by OmerErbalta on 26.10.2023.
//

import Foundation
import Firebase
class FeedCellViewModel:ObservableObject{


    func checkPostLiked(post:Post) -> Bool{
        
        let userId = AuthService.shared.currentUser?.id
        if((post.likedList?.contains(userId!)) == true ){
            return true
        }
        else{
            return false
        }
    }
    
    func likedPost(post:Post,userId:String) async throws ->(post:Post,liked:Bool){
        var likeList = post.likedList ?? []
        var data = [String:Any]()
        var liked = false
        
        if let index = likeList.firstIndex(of: userId){
               likeList.remove(at: index)
            }
            else{
                likeList.append(userId)
            }
    
        data["likedList"] = likeList
        try await Firestore.firestore().collection("posts").document(post.id).updateData(data)
        var returnedPost = try await PostService.fetchPost(uid: post.id)
        returnedPost.user = post.user
        
        if ((returnedPost.likedList?.contains(userId)) == true){
            liked = true
        }
        
        return (post:returnedPost,liked:liked)
    }
}

