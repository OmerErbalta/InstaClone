//
//  SignupView.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import SwiftUI

struct SignupView: View {
    @State private var email = ""
    @Environment (\.dismiss) var dismiss
    var body: some View {
        VStack(spacing:12) {
            
            Text("Add your email")
                .font(.title2)
                .foregroundStyle(.black)
            .fontWeight(.bold)
            .padding(.top)
            
            Text("you'll use this email to sign in to your account")
                .font(.subheadline)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal,24)
            
            TextField("Email", text: $email)
                .modifier(IGTextFieldModifier())
                
            NavigationLink {
                CreateUsernameView()
                    .navigationBarBackButtonHidden(true)
            } label: {
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
    SignupView()
}
