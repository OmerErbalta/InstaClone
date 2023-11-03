//
//  UploadPostViewModel.swift
//  InstaProject
//
//  Created by OmerErbalta on 23.10.2023.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class UploadPostViewModel : ObservableObject{
   
    private var uiImage : UIImage?
    @Published var uploadImage : Image?
 
    
    @Published var selectedItem : PhotosPickerItem?{
        didSet{Task{ await loadImage(fromItem: selectedItem)}}
    }

    
    func loadImage(fromItem item : PhotosPickerItem?)async{
        guard let item = item else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else  {return}
        guard let uiImage = UIImage(data: data) else{return}
        self.uiImage = uiImage
        self.uploadImage = Image(uiImage: uiImage)
        
    }
    func uploadPost(caption:String)async throws{
        
        guard let uid = Auth.auth().currentUser?.uid else{return}
        guard let uiImage = uiImage else {return}
        guard let imageUrl = try await ImageUploder.imageUpload(image: uiImage) else {return}
        let postRef = Firestore.firestore().collection("posts").document()
        
        let post = Post(id: postRef.documentID, ownerUuid: uid, caption: caption, commentCount: 0, ımageUrl: imageUrl, timeStap: Timestamp())
        
        guard let encoderPost = try? Firestore.Encoder().encode(post) else{return}
        
        try await postRef.setData(encoderPost)
        
    }
    
}
