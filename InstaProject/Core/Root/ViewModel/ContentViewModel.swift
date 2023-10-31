//
//  ContentViewModel.swift
//  InstaProject
//
//  Created by OmerErbalta on 23.10.2023.
//

import Foundation
import Firebase
import Combine

class ContentViewModel : ObservableObject{
    private let service = AuthService.shared
    private var cansellables = Set<AnyCancellable>()
    @Published var currentUser : User?
    @Published var userSession : FirebaseAuth.User?
    
    init(){
        setupSubscribers()
    }

    func setupSubscribers(){
        service.$userSession.sink { [weak self] userSession  in
            self?.userSession = userSession
        }.store(in: &cansellables)
        
        service.$currentUser.sink { [weak self] currentUser  in
            DispatchQueue.main.async {
                self?.currentUser = currentUser
            }
            
        }.store(in: &cansellables)
    }
    
}
