//
//  CreateUsernameView.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import SwiftUI

struct CreatePasswordView: View {
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var viewModel : RegistirationViewModel
    var body: some View {
        NavigationStack {
            VStack(spacing:12) {
                
                Text("Create password")
                    .font(.title2)
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("Your password must be at least 6 charachters in lenght")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,24)
                
                SecureField("Password", text: $viewModel.password)
                    .modifier(IGTextFieldModifier())
                    .padding(.top,15)

                
                NavigationLink{
                    CompleteSignUpvView()
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
    CreatePasswordView()
}
