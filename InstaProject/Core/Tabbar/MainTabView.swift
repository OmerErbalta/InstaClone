//
//  MainTabbarView.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import SwiftUI

struct MainTabView: View {
    @State private var tabViewIndex = 0
    @EnvironmentObject var viewSwitch: ViewSwitch

    let user : User
    var body: some View {
        
        if viewSwitch.showRoot == .Tabbed{
            TabView(selection:$tabViewIndex){
                FeedView()
                    
                    .environmentObject(viewSwitch)
                    .onAppear{
                        tabViewIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "house")
                    }
                    .tag(0)
                SerachView()
                    .onAppear{
                        tabViewIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                    .tag(1)
                
                UploadPostView( tabIndex: $tabViewIndex)
                    .onAppear{
                        tabViewIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "plus.square")
                    }
                    .tag(2)
                
                Text("Notification")
                    .onAppear{
                        tabViewIndex = 3
                    }
                    .tabItem {
                        Image(systemName: "heart")
                    }
                    .tag(3)
                
                
                ProfileView(user: user  )
                    .environmentObject(viewSwitch)
                    .onAppear{
                        tabViewIndex = 4
                    }
                    .tabItem {
                        Image(systemName: "person")
                    }
                    .tag(4)
            }
        }
        if viewSwitch.showRoot == .WithoutTabbed {
                   MessageBoxView()
                    .transition(.move(edge: .trailing))
                    .environmentObject(viewSwitch)
                        
               }
    }
}

//#Preview {
  //  MainTabView()
//}
enum WindowRoot {
    case Tabbed
    case WithoutTabbed
}


class ViewSwitch: ObservableObject {
    var user : User?
    public init() {
       
    }
    
    @Published public var showRoot: WindowRoot = .Tabbed
    public func changeRootView(to root: WindowRoot) {
        showRoot = root
    }
}
