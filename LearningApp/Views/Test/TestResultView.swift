//
//  TestResultView.swift
//  LearningApp
//
//  Created by Braydon Whitfield on 2021-07-19.
//

import SwiftUI

struct TestResultView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var numCorrect: Int
    
    var resultHeading: String {
        
        guard model.currentModule != nil else {
            return ""
        }
        
        let percent = Double(numCorrect)/Double(model.currentModule!.test.questions.count)
        
        if percent > 0.7 {
            return "Awesome!"
        } else if percent > 0.5 {
            return "Doing great!"
        } else {
            return "Keep learning"
        }
    }
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text("\(resultHeading)")
                .font(.title)
            
            Spacer()
            
            Text("You got \(numCorrect) out of \(model.currentModule?.test.questions.count ?? 0) questions")
            
            Spacer()
            
            Button {
                
                model.currentTestSelected = nil
            } label: {
                
                ZStack {
                    
                    RectangleCard(color: .green)
                        .frame(height: 48)
                    
                    Text("Complete")
                        .bold()
                        .foregroundColor(.white)
                }
            }.padding()
            
            Spacer()
        }
    }
    
}


