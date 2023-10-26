//
//  CircleProfileImage.swift
//  InstaProject
//
//  Created by OmerErbalta on 25.10.2023.
//

import SwiftUI
import Kingfisher


enum ProfileImageSize{
    case xsmall
    case small
    case medium
    case lage
    case xlage
    
    var deminsion : CGFloat{
        switch self {
        case .xsmall:
            return 40
        case .small:
            return 50
        case .medium:
            return 60
        case .lage:
            return 70
        case .xlage:
            return 80
        }
    }
}

struct CircleProfileImage: View {
    let user : User
    let size : ProfileImageSize
    var body: some View {
        
        if let imageUrl = user.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.deminsion,height:size.deminsion)
                .clipShape(.circle)
            
        }
        else{
            Image("personImage")
                .resizable()
                .scaledToFill()
                .frame(width: size.deminsion ,height: size.deminsion)
                .clipShape(.circle)
        }
    }
}

#Preview {
    CircleProfileImage(user: User.MOCK_USER.first!, size: .medium)
}
