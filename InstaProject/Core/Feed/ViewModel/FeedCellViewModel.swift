//
//  FeedCellViewModel.swift
//  InstaProject
//
//  Created by OmerErbalta on 26.10.2023.
//

import Foundation
import Firebase
class FeedCellViewModel:ObservableObject{


    func calculateTimeDifference(date:Timestamp)-> String{
        var time = date.dateValue()
        let timeDifference = Calendar.current.dateComponents([.day,.hour,.minute], from: time,to: Date())
        print(timeDifference)
        
        if let day = timeDifference.day, day >= 1 {
            return "\(day) d"
        }
        
        if let hours = timeDifference.hour, hours >= 1 {
            return "\(hours) h"
        }
        else if let minute = timeDifference.minute {
            return "\(minute) m"
        }
        
        return ""
        
    }
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

