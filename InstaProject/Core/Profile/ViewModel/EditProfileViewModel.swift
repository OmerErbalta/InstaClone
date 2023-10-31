//
//  ProfileViewModel.swift
//  InstaProject
//
//  Created by OmerErbalta on 25.10.2023.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase
@MainActor
class EditProfileViewModel:ObservableObject{
    @Published var user : User
    @Published var selectedItem : PhotosPickerItem?{
        didSet{Task{ await loadImage(fromItem: selectedItem)}}
    }
    @Published var profileImage : Image?
    @Published var fullName  = ""
    @Published var bio = ""
    private var uiImage :UIImage?
    
    init(user:User) {
        self.user = user
        if let fullName = user.fullName{
            self.fullName = fullName
        }
        if let bio = user.bio {
            self.bio = bio
        }
    }
    func loadImage(fromItem item : PhotosPickerItem?)async{
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else  {return}
        guard let uiImage = UIImage(data: data) else{return}
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
        
    }
    func updateUserData() async throws{
        
       var data = [String :Any]()
        // update image
        if let uiImage = uiImage{
           let imageUrl = try? await ImageUploder.imageUpload(image:uiImage )
            data["profileImageUrl"] = imageUrl
        }
        
        //update name
        if !fullName.isEmpty && fullName != user.fullName{
            data["fullName"] = fullName
        }
        
        //update bio
        if !bio.isEmpty && bio != user.bio{
            data["bio"] = bio
        }
        if !data.isEmpty{
          try await Firestore.firestore().collection("users").document(user.id).updateData(data)
          
        }
    }
}
