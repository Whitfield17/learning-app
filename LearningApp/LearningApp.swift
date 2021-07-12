//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Braydon Whitfield on 2021-07-12.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
