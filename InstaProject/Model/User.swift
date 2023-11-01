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
    var fallowing : Int = 0
    var fallower : Int = 0
    var bio : String?
    
    
}
extension User{
    static var MOCK_USER : [User] = [
        .init(id: UUID().uuidString, email: "Hata@gmail.com", username: "UserNameHata", password: "hata",profileImageUrl: nil,fullName: "HATA..",fallowing: 25, fallower: 20, bio: "Hata..")
        ,
        .init(id: UUID().uuidString, email: "Mert@gmail.com", username: "mertAlp", password: "mert123",profileImageUrl: "superman",fullName: "Mert Alp",bio: "Ios Developer")
        ,
        .init(id: UUID().uuidString, email: "selim@gmail.com", username: "selimEvrenErbalta", password: "selim123",profileImageUrl: "brim",fullName: "Selim Eren Erbalta",fallowing:20, fallower: 5, bio: "Pro Gamer")
        ,
        .init(id: UUID().uuidString, email: "Burak@gmail.com", username: "Burak Aslan", password: "burak123",profileImageUrl: "ironman",fullName: "Burak Aslan",fallowing:20, fallower: 5,bio: "Sap Developer")
        ,
        .init(id: UUID().uuidString, email: "kerem@gmail.com", username: "keremTaner", password: "kerem123",profileImageUrl: "batman",fullName: "Kerem Taner",fallowing:20, fallower: 5,bio: "JS Developer")
        ,.init(id: UUID().uuidString, email: "erbaltaFun@gmail.com", username: "omerErbaltaFunClup", password: "omer190331",profileImageUrl: "myPhoto",fullName:nil ,fallowing:20, fallower: 5,bio: "Ios Developer")
        
    ]
}
