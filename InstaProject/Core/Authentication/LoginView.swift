//
//  LoginView.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                //logo
                Text("Instagram Clone")
                    .font(.title)
                    .fontWeight(.heavy)
                //Textfields - forget Password
                VStack {
                    TextField("Enter Your Email", text: $email)
                        .textInputAutocapitalization(.none)
                        .modifier(IGTextFieldModifier())
                    
                    SecureField("Password", text: $email)
                        .modifier(IGTextFieldModifier())
                }
                Button(action: {}, label: {
                    Text("Forget Password ?")
                        .frame(maxWidth: .infinity,alignment: .trailing)
                        .frame(width: Const.width)
                        .padding(.trailing,12)
                        .padding(.top,20)
                })
                .frame(maxWidth: .infinity,alignment: .trailing)
                
                //Login button - with facebook
            
                Button(action: {}, label: {
                    Text("Log In")
                        .frame( maxWidth: .infinity,alignment: .center)
                        .frame(width: Const.width * 0.9 ,height: 40)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                    

                })
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.vertical ,15)
                
                HStack{
                    Rectangle()
                        .frame(width: Const.width / 2 - 40 ,height:0.5 )
                    Text("OR").font(.footnote)
                        .fontWeight(.semibold)
                    Rectangle()
                        .frame(width: Const.width / 2 - 40 ,height: 0.5)
                }
                .foregroundStyle(.gray)
                
                HStack{
                    Image("facebookLogo")
                        .resizable()
                        .frame(width: 30,height: 30)
                    Text("Continue with facebook")
                        .foregroundStyle(.blue)
                        .fontWeight(.semibold)
                        .font(.callout)
                }
                Spacer()
                Divider()
                NavigationLink{
                    SignupView()
                        .navigationBarBackButtonHidden(true)

                }label: {
                    HStack(spacing:3) {
                        Text("Don't Have an acount ?") +
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.blue)
                    .font(.callout)
                    
                }
                .padding(.vertical,16)
                
            }
        }
    }
}

#Preview {
    LoginView()
}
