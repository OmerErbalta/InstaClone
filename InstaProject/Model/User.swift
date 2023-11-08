//
//  UserModel.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import Foundation

struct User:Identifiable,Codable{
    let id: String
    let email :String
    var username : String
    var password : String
    var profileImageUrl : String?
    var fullName : String?
    var fallowing : [String]?
    var fallower : [String]?
    var postCount : Int? = 0
    var chatList : [Chat]?
    var bio : String?
    
    
}
extension User{
    static var MOCK_USER : [User] = [
        .init(id: UUID().uuidString, email: "Hata@gmail.com", username: "UserNameHata", password: "hata",profileImageUrl: nil,fullName: "HATA..", bio: "Hata..")
        ,
        .init(id: UUID().uuidString, email: "Mert@gmail.com", username: "mertAlp", password: "mert123",profileImageUrl: "superman",fullName: "Mert Alp",bio: "Ios Developer")
        ,
        .init(id: UUID().uuidString, email: "selim@gmail.com", username: "selimEvrenErbalta", password: "selim123",profileImageUrl: "brim",fullName: "Selim Eren Erbalta", bio: "Pro Gamer")
        ,
        .init(id: UUID().uuidString, email: "Burak@gmail.com", username: "Burak Aslan", password: "burak123",profileImageUrl: "ironman",fullName: "Burak Aslan",bio: "Sap Developer")
        ,
        .init(id: UUID().uuidString, email: "kerem@gmail.com", username: "keremTaner", password: "kerem123",profileImageUrl: "batman",fullName: "Kerem Taner",bio: "JS Developer")
        ,.init(id: UUID().uuidString, email: "erbaltaFun@gmail.com", username: "omerErbaltaFunClup", password: "omer190331",profileImageUrl: "myPhoto",fullName:nil ,bio: "Ios Developer")
        
    ]
}
