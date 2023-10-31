//
//  RegistirationViewModel.swift
//  InstaProject
//
//  Created by OmerErbalta on 23.10.2023.
//

import Foundation

class RegistirationViewModel : ObservableObject{
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser()  async throws{
       try await AuthService.shared.createUser(email: self.email, password: self.password, username: self.username)
    }

}
