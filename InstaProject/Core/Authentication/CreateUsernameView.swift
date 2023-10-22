//
//  CreateUsernameView.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import SwiftUI

struct CreateUsernameView: View {
    @State private var username = ""
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing:12) {
                
                Text("Create Username")
                    .font(.title2)
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("Pick a username for your new account yo can always change it later")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,24)
                
                TextField("Username", text: $username)
                    .modifier(IGTextFieldModifier())
                
                NavigationLink(){
                    CreatePasswordView()
                }label: {
                    Text("Next")
                        .frame( maxWidth: .infinity,alignment: .center)
                        .frame(width: Const.width * 0.9 ,height: 50)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                }
                .clipShape(.rect(cornerRadius: 10))
                .padding(.vertical ,10)
                Spacer()
            }
        }
        .toolbar{
           ToolbarItem(placement: .topBarLeading) {
               Image(systemName:"chevron.left")
                   .imageScale(.large)
                   .navigationBarBackButtonHidden(true)
                   .onTapGesture {
                       dismiss()
                   }
           }
       }
    }
}

#Preview {
    CreateUsernameView()
}
