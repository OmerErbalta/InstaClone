//
//  MainTabbarView.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {

        TabView{
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
                SerachView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            Text("Upload Post")
                .tabItem {
                    Image(systemName: "plus.square")
                }
            
            Text("Notification")
                .tabItem {
                    Image(systemName: "heart")
                }
            
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
    }
}

#Preview {
    MainTabView()
}
