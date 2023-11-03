//
//  Post.swift
//  InstaProject
//
//  Created by OmerErbalta on 23.10.2023.
//

import Foundation
import Firebase
struct Post : Identifiable,Codable{

    
    let id : String
    let ownerUuid : String
    let caption : String
    let commentCount : Int?
    let ımageUrl : String
    let timeStap : Timestamp
    var user : User?
    var likedList: [String]?
    var commentList : [Comment]?
}

extension Post{
    static var MOCK_POSTS: [Post] = [
        .init(id: UUID().uuidString, ownerUuid: UUID().uuidString, caption: "HATA", commentCount: 0, ımageUrl: "", timeStap: Timestamp(), user: User.MOCK_USER[0],commentList:Comment.MOCK_COMMENT)
        
        ,
        .init(
            id: UUID().uuidString,
            ownerUuid: UUID().uuidString,
            caption: " Çok Yakışıklıyım",
            commentCount: 999,
            ımageUrl: "profilePhoto",
            timeStap: Timestamp(),
            user: User.MOCK_USER[0]),
        
        .init(
            id: UUID().uuidString,
            ownerUuid: UUID().uuidString,
            caption: " Boş İnsanım",
            commentCount: 999,
            ımageUrl: "supermanFeed",
            timeStap: Timestamp(),
            user: User.MOCK_USER[1]),
        .init(
            id: UUID().uuidString,
            ownerUuid: UUID().uuidString,
            caption: " Demir elo",
            commentCount: 999,
            ımageUrl: "jetFeed",
            timeStap: Timestamp(),
            user: User.MOCK_USER[2]),
        .init(
            id: UUID().uuidString,
            ownerUuid: UUID().uuidString,
            caption: " Bra ",
            commentCount: 999,
            ımageUrl: "ironmanFeed",
            timeStap:Timestamp(),
            user: User.MOCK_USER[3]),
        .init(
            id: UUID().uuidString,
            ownerUuid: UUID().uuidString,
            caption: " Bra ",
            commentCount: 999,
            ımageUrl: "ironmanFeed",
            timeStap: Timestamp(),
            user: User.MOCK_USER[3]),
        .init(
            id: UUID().uuidString,
            ownerUuid: UUID().uuidString,
            caption: " yarasa adam",
            commentCount: 999,
            ımageUrl: "batmanFeed",
            timeStap:Timestamp(),
            user: User.MOCK_USER[4]),
    ]
    
}
