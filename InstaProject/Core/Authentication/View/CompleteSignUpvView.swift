//
//  CompleteSignUpvView.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import SwiftUI

struct CompleteSignUpvView: View {
    @Environment (\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack(spacing:12) {
                Text("Welcome to InstaClone")
                Text("Ömer Erbalta")
                    .font(.title2)
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
               
            }
            .font(.title2)
            .foregroundStyle(.black)
            .fontWeight(.bold)
            .padding(.top)
            
            Text("Click bellow to complete registation and start InstaClone")
            .font(.subheadline)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal,24)
            Button(action: {
                print("Sign Up")
            }, label: {
                Text("Complete Sign Up")
                    .frame( maxWidth: .infinity,alignment: .center)
                    .frame(width: Const.width * 0.9 ,height: 40)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                

            })
                .clipShape(.rect(cornerRadius: 10))
                .padding(.vertical ,15)
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
    CompleteSignUpvView()
}
