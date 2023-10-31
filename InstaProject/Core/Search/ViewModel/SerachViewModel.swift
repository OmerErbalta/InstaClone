//
//  SerachViewModel.swift
//  InstaProject
//
//  Created by OmerErbalta on 25.10.2023.
//

import Foundation

class SerachViewModel : ObservableObject{
    @Published var users = [User]()
    
    
    init() {
        Task{
            try await fetchAllUsers()
        }
    }
    @MainActor
    func fetchAllUsers() async throws{
            self.users = try await UserService.fetchAllUsers()
        
    }
}
