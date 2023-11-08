//
//  ContentView.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registirationViewModel = RegistirationViewModel()
    let viewSwitch = ViewSwitch()
   
    var body: some View {
        Group{
            if viewModel.currentUser == nil{
                LoginView()
                    .environmentObject(registirationViewModel)
                
            }
            else if let currentUser = viewModel.currentUser{
                MainTabView(user: currentUser)
                    .environmentObject(viewSwitch)
            }
        }
    }
}

#Preview {
    ContentView()
}
