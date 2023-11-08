//
//  Message.swift
//  InstaProject
//
//  Created by OmerErbalta on 6.11.2023.
//

import Foundation
import Firebase

struct Message:Identifiable,Codable {
    let id : String
    let message : String
    let user : String
   // let timeStap : Timestamp
    
}

