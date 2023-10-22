//
//  FeedCell.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack{
            //User Info
            HStack{
                Image("profilePhoto")
                    .resizable()
                    .frame(width: Const.width * 0.1,height: Const.width * 0.1)
                    .scaledToFill()
                    .clipShape(.circle)
                VStack(alignment:.leading) {
                    Text("Ömer Erbalta")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("erbalta80@gmail")
                        .font(.callout)
                        .foregroundStyle(.black)
                        .opacity(0.4)
                    
                }
                Spacer()
                
            }.padding(.leading,10)
            //Post
            Image("profilePhoto")
                .resizable()
                .frame(width: Const.width , height: Const.height * 0.4)
                .scaledToFit()
                .clipShape(Rectangle())
            
            
            // action buttons
            HStack(spacing:15){
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                })
                Button(action: {}, label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                })
                Spacer()
            }
            .padding(.leading,10)
            .foregroundStyle(.black)

            //like label
            Text("45 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,8)
                .padding(.top,2)
            // caption label
            
            HStack {
                Text("Ömer Erbalta ")
                    .fontWeight(.semibold) +
                Text("Çok yakışıklıyım")
            }.frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,8)
                .font(.footnote)
                .padding(.top,2)
                
            Text("12h").font(.footnote).opacity(0.5)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
            
        }
    }
}

#Preview {
    FeedCell()
}
