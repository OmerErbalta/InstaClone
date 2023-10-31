//
//  InstaProjectApp.swift
//  InstaProject
//
//  Created by OmerErbalta on 22.10.2023.
//

import SwiftUI
import FirebaseCore
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      
    return true
  }
}
@main
struct InstaProjectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
      
        WindowGroup {
            ContentView()
        }
    }
}
