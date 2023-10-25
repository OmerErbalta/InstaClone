//
//  EditProfileView.swift
//  InstaProject
//
//  Created by OmerErbalta on 25.10.2023.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State var user : User
    @State private var selectedImage : PhotosPickerItem?
    @State private var name = ""
    @State private var bio = ""
    var body: some View {
        
        VStack{
            //toolbar
            HStack{
                Button("Cancel"){
                    dismiss()
                }
                .fontWeight(.bold)
                .font(.headline)
                Spacer()
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
                
                Button("Done"){
                    dismiss()
                }
                .font(.headline)
                .fontWeight(.bold)
            }
            Divider()
            .padding(.horizontal,10)
            .padding(.bottom,20)
        
            
            
            PhotosPicker(selection: $selectedImage) {
                VStack {
                    Image(user.profileImageUrl ?? "personImage")
                        .resizable()
                        .frame(width: 80,height: 80)
                    .clipShape(.circle)
                    
                    Text("Edit Profile Image")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                }
               
            }
            
          
            Divider()
                .frame(height: 1)
                .background(.gray).opacity(0.6)
                .padding(.bottom,30)
            
        
            
            EditProfileRow(title: "Name", placeholder: "Enter your name..", text: $name)
            EditProfileRow(title: "Bio", placeholder: "Enter your bio..", text: $bio)
            
            Spacer()
            
        }
    }
}

#Preview {
    EditProfileView( user: User(id: "", email: "", username: "", password: "") )
}

struct EditProfileRow: View {
    let title : String
    let placeholder : String
    @Binding var  text : String
    var body: some View {
        HStack{
            Text(title)
                .padding(.leading,8)
                .frame(width: 100,alignment: .leading)
            TextField(placeholder, text: $text)
            Divider()
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}
