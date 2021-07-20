//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Braydon Whitfield on 2021-07-12.
//

import SwiftUI
import Firebase

@main
struct LearningApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
