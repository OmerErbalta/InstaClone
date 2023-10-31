//
//  LoginViewModel.swift
//  InstaProject
//
//  Created by OmerErbalta on 24.10.2023.
//

import Foundation

class LoginViewModel : ObservableObject{
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws{
      try await AuthService.shared.login(withEmail: email, password: password)
        
    }
}
