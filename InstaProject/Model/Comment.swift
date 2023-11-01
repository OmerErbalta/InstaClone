//
//  Comment.swift
//  InstaProject
//
//  Created by OmerErbalta on 31.10.2023.
//

import Foundation
import Firebase

struct Comment:Identifiable,Codable{
    let id : String
    let comment : String
    let timeStap : Timestamp
    let userId : String
    var user : User?
    var likeList : [String]?
}

extension Comment{
    static var MOCK_COMMENT: [Comment]=[
        .init(id: UUID().uuidString, comment: "Customize your nav You can now focus your console experience by customizing your navigation", timeStap: Timestamp(), userId:"",user: User.MOCK_USER[0])
    ]
}
