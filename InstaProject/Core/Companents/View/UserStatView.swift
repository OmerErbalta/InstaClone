//
//  UserStatView.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import SwiftUI

struct UserStatView: View {
    let value : Int
    let title : String
    var body: some View {
        VStack{
            Text("\(value)").font(.title3).fontWeight(.semibold)
            Text(title).font(.footnote)
        }.frame(width: Const.width * 0.23)
    }
}

#Preview {
    UserStatView(value: 7, title: "Followers")
}
