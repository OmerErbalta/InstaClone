//
//  UploadPostView.swift
//  InstaProject
//
//  Created by OmerErbalta on 23.10.2023.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State var caption = ""
    @State var imagePickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @StateObject var feeViewModel = FeedViewModel()
    @Binding var  tabIndex :Int
    var body: some View {
        VStack{
            //action tool bar
            HStack{
                
                //cancel butto
                Button(action: {
                    clearPostData()
                }, label: {
                    Text("Cancel")
                        
                })
                Spacer()
                Text("New Post")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
               //upload button
                Button(action: {
                    Task{
                        try await viewModel.uploadPost(caption:caption)
                        clearPostData()
                    }
                }, label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                })
                
                
            
                
                
            }
            .fontWeight(.semibold)
            .padding(.horizontal)
            
            //post image and caption
            HStack(spacing:10){
                if viewModel.uploadImage != nil { 
                    if let image = viewModel.uploadImage{
                    image
                            .resizable()
                            .scaledToFit()
                            .clipped()
                            .frame(width: Const.width * 0.3,height: Const.width * 0.3)
                            .onTapGesture {
                                imagePickerPresented = true
                            }
                    }
                }
                else{
                    Text("Add photo..")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .clipped()
                        .frame(width: Const.width * 0.2,height: Const.width * 0.2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray,lineWidth: 1))
                        .onTapGesture {
                            imagePickerPresented = true
                        }
                    
                }
                    
                
                TextField("Enter Your Caption...", text: $caption,axis: .vertical)
                
            }
            Spacer()
        }
        .onAppear{
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedItem)
    }
    func clearPostData(){
        caption = ""
        viewModel.selectedItem = nil
        viewModel.uploadImage = nil
        tabIndex = 0
    }
}

#Preview {
    UploadPostView( tabIndex: .constant(0))
}
