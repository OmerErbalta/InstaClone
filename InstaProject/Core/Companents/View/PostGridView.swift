//
//  PostGridView.swift
//  InstaProject
//
//  Created by OmerErbalta on 23.10.2023.
//

import SwiftUI
import Kingfisher
struct PostGridView: View {
    @StateObject var viewModel : PostGridViewModel
    var postCount = 0
    init(user:User){
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    private let imageDimension : CGFloat = (Const.width / 3 )-1
    private let gridItems :[GridItem] = [
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1)
        
    ]
    var body: some View {
        VStack{
            LazyVGrid(columns : gridItems,spacing: 1){
                ForEach(viewModel.posts ){ post in
                            NavigationLink{
                                FeedCell(post: post)
                            }label: {
                                KFImage(URL(string: post.ımageUrl))
                                    .resizable()
                                    .frame(width: imageDimension,height: imageDimension)
                                    .scaledToFill()
                                    .clipped()
                            }
                        
                }
                
            }
            
        }
    }
}

#Preview {
    PostGridView(user: User.MOCK_USER.first!)
}
