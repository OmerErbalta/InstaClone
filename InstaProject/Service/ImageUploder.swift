//
//  ImageUploder.swift
//  InstaProject
//
//  Created by OmerErbalta on 25.10.2023.
//

import Foundation
import Firebase
import FirebaseStorage
struct ImageUploder{
    static func imageUpload(image:UIImage)async throws -> String?{
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return nil}
        let filename = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
        
        do{
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
            
            
        }catch{
            print("Debug: Faild to upload profile Image \(error.localizedDescription)")
            return nil
        }
    }
}
