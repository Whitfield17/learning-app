//
//  RectangleCard.swift
//  LearningApp
//
//  Created by Braydon Whitfield on 2021-07-16.
//

import SwiftUI

struct RectangleCard: View {
    
    var color = Color.white
    
    var body: some View {
        
        Rectangle()
            .foregroundColor(color)
            .cornerRadius(10)
            .shadow(radius: 5)
        
    }
}
